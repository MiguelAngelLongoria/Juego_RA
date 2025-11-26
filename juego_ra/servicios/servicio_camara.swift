
//
//  servicio_camara.swift
//  juego_ra
//
//  Created by Miguel Angel Longoria Granados on 12/11/25.
//

import Foundation
import AVFoundation
import UIKit

@Observable
class ServicioCamara: NSObject, AVCaptureMetadataOutputObjectsDelegate {
    
    private let sesion = AVCaptureSession()
    private var previsualizacion: AVCaptureVideoPreviewLayer?
    
    private let salidaCodigos = AVCaptureMetadataOutput()
    
    // Callback del código
    var codigoDetectado: ((String) -> Void)?
    
    private let colaSesion = DispatchQueue(label: "sesion.video")
    
    // MARK: - AUTORIZACIÓN
    func autorizacion_camara() async -> Bool {
        let estado = AVCaptureDevice.authorizationStatus(for: .video)
        
        if estado == .notDetermined {
            let aceptado = await AVCaptureDevice.requestAccess(for: .video)
            return aceptado
        }
        
        return estado == .authorized
    }
    
    override init() {
        super.init()
        
        Task {
            let ok = await autorizacion_camara()
            if !ok {
                print("⚠️ No hay permiso de cámara")
            }
        }
    }
    
    
    // MARK: - INICIAR
    func iniciar() {
        colaSesion.async { [weak self] in
            guard let self else { return }
            
            guard let dispositivo = AVCaptureDevice.default(for: .video),
                  let entrada = try? AVCaptureDeviceInput(device: dispositivo)
            else { return }
            
            self.sesion.beginConfiguration()
            
            if self.sesion.canAddInput(entrada) {
                self.sesion.addInput(entrada)
            }
            
            // Salida para QR y códigos de barra
            if self.sesion.canAddOutput(self.salidaCodigos) {
                self.sesion.addOutput(self.salidaCodigos)
                
                self.salidaCodigos.setMetadataObjectsDelegate(self, queue: .main)
                self.salidaCodigos.metadataObjectTypes = [
                    .qr, .ean8, .ean13, .code128, .code39, .code93,
                    .upce, .pdf417, .aztec, .dataMatrix
                ]
            }
            
            self.sesion.commitConfiguration()
            self.sesion.startRunning()
        }
    }
    
    
    // MARK: - DETENER
    func detener() {
        colaSesion.async { [weak self] in
            guard let self else { return }
            
            self.sesion.stopRunning()
            
            self.sesion.beginConfiguration()
            self.sesion.inputs.forEach { self.sesion.removeInput($0) }
            self.sesion.outputs.forEach { self.sesion.removeOutput($0) }
            self.sesion.commitConfiguration()
            
            self.previsualizacion = nil
        }
    }
    
    
    // MARK: - PREVIEW
    func obtener_previsualizacion_camara() -> AVCaptureVideoPreviewLayer {
        if let capa = previsualizacion {
            return capa
        }
        
        let capa = AVCaptureVideoPreviewLayer(session: sesion)
        capa.videoGravity = .resizeAspectFill
        self.previsualizacion = capa
        return capa
    }
    
    
    // MARK: - LECTURA DE CÓDIGOS
    func metadataOutput(_ output: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        
        guard let objeto = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
              let valor = objeto.stringValue else { return }
        
        // Para evitar spam excesivo
        sesion.stopRunning()
        codigoDetectado?(valor)
        
        // Vuelve a iniciar tras 1 segundo para no trabar el UI
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.sesion.startRunning()
        }
    }
}
