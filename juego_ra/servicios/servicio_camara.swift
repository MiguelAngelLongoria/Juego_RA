
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
        
    private var entrada_del_dispositivo: AVCaptureDeviceInput?
    private var salida_de_video: AVCaptureVideoDataOutput?
    
    private var previsualizacion: AVCaptureVideoPreviewLayer?
    
    // --- NUEVO: Salida para leer QR y códigos de barra ---
    private let salidaCodigos = AVCaptureMetadataOutput()
    
    // Callback para mandar el código detectado
    var codigoDetectado: ((String) -> Void)?
    // ----------------------------------------------------
    
    private let tipo_camara_preferida = AVCaptureDevice.default(for: .video)
    
    private var lista_de_sesion = DispatchQueue(label: "sesion.video")
    
    
    // MARK: - AUTORIZACIÓN
    func autorizacion_camara() async -> Bool {
        let estado_autorizacion = AVCaptureDevice.authorizationStatus(for: .video)
        
        if estado_autorizacion == .notDetermined {
            await AVCaptureDevice.requestAccess(for: .video)
        }
        
        return estado_autorizacion == .authorized
    }
    
    
    // MARK: - INIT
    override init() {
        super.init()
        Task {
            await autorizacion_camara()
        }
    }
    
    
    // MARK: - INICIAR CÁMARA + DETECCIÓN
    func iniciar() {
        guard let dispositivo = AVCaptureDevice.default(for: .video),
              let entrada = try? AVCaptureDeviceInput(device: dispositivo),
              sesion.canAddInput(entrada)
        else {
            return
        }
        
        sesion.beginConfiguration()
        
        // Entrada de cámara
        sesion.addInput(entrada)
        
        
        // --- NUEVO: Salida para códigos ---
        if sesion.canAddOutput(salidaCodigos) {
            sesion.addOutput(salidaCodigos)
            salidaCodigos.setMetadataObjectsDelegate(self, queue: .main)
            
            // Tipos que la cámara podrá leer
            salidaCodigos.metadataObjectTypes = [
                .qr,
                .ean8,
                .ean13,
                .code128,
                .code39,
                .code93,
                .upce,
                .pdf417,
                .aztec,
                .dataMatrix
            ]
        }
        // ---------------------------------
        
        
        sesion.commitConfiguration()
        sesion.startRunning()
    }
    
    
    // MARK: - DETENER
    func detener() {
        sesion.stopRunning()
        
        sesion.beginConfiguration()
        sesion.inputs.forEach { sesion.removeInput($0) }
        sesion.outputs.forEach { sesion.removeOutput($0) }
        sesion.commitConfiguration()
        
        previsualizacion = nil
    }
    
    
    // MARK: - PREVISUALIZACIÓN
    func obtener_previsualizacion_camara() -> AVCaptureVideoPreviewLayer {
        if let capa = previsualizacion {
            return capa
        }
        
        let capa = AVCaptureVideoPreviewLayer(session: sesion)
        capa.videoGravity = .resizeAspectFill
        previsualizacion = capa
        return capa
    }
    
    
    // MARK: - DELEGADO DE CÓDIGOS DETECTADOS
    func metadataOutput(_ output: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        
        guard let objeto = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
              let valor = objeto.stringValue
        else { return }
        
        // Enviar el valor detectado
        codigoDetectado?(valor)
    }
}

