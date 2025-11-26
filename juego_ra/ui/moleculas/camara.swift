//
//  camara.swift
//  juego_ra
//
//  Created by Miguel Angel Longoria Granados on 12/11/25.
//
import SwiftUI

struct VistaCamara: View {
    @State var servicio_camara = ServicioCamara()
    
    // Imagen que se mostrará si se detecta un QR válido
    @State private var imagenAmostrar: String? = nil
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Camara_pantallita(capa_sesion: servicio_camara.obtener_previsualizacion_camara())
                    .ignoresSafeArea()
            }
            
            // Si hay imagen → mostrarla arriba de la cámara
            if let nombreImagen = imagenAmostrar {
                Image(nombreImagen)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .shadow(radius: 10)
                    .transition(.opacity)
            }
        }
        .onAppear {
            servicio_camara.codigoDetectado = { codigo in

                switch codigo {
                case "imagen_01":
                    imagenAmostrar = "1"  // Esta es la imagen del Assets
                    print("Mostrando imagen 1")
                    
                default:
                    imagenAmostrar = nil
                    print("Código no reconocido")
                }
            }
            
            servicio_camara.iniciar()
        }
        .onDisappear {
            servicio_camara.detener()
        }
    }
}

#Preview {
    VistaCamara()
}
