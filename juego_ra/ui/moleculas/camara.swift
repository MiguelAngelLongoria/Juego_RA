//
//  VistaCamara.swift
//  juego_ra
//

import SwiftUI

struct VistaCamara: View {
    @State var servicio_camara = ServicioCamara()
    
    /// Número de pista que esta cámara debe validar (1–4)
    var pistaActual: Int = 1
    
    @State private var mensajeError: String? = nil
    @State private var navegar = false
    
    // Datos que se enviarán a la pantalla final
    @State private var destinoNumero: Int = 0
    @State private var destinoImagen: String = ""
    @State private var destinoTexto: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                GeometryReader { _ in
                    Camara_pantallita(capa_sesion: servicio_camara.obtener_previsualizacion_camara())
                        .ignoresSafeArea()
                }
                
                if let mensaje = mensajeError {
                    Text(mensaje)
                        .font(.headline)
                        .padding()
                        .background(Color.red.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.top, 40)
                }
                
                // Navegación invisible
                NavigationLink("", isActive: $navegar) {
                    PantallaImagen(
                        numero: destinoNumero,
                        imagen: destinoImagen,
                        texto: destinoTexto
                    )
                }
                .hidden()
            }
            .onAppear {
                servicio_camara.codigoDetectado = { codigo in
                    validarCodigo(codigo)
                }
                servicio_camara.iniciar()
            }
            .onDisappear {
                servicio_camara.detener()
            }
        }
    }
    
    // MARK: - Validación por pista
    func validarCodigo(_ codigo: String) {
        mensajeError = nil
        
        switch pistaActual {
            
        case 1:
            if codigo == "imagen_01" {
                destinoNumero = 1
                destinoImagen = "6"
                destinoTexto = "Dicen que cada átomo de nuestro cuerpo fue parte de una estrella. Quizá no me voy… quizá regreso a casa."
                navegar = true
            } else {
                mensajeError = "No es la pista correcta"
            }
            
        case 2:
            if codigo == "imagen_02" {
                destinoNumero = 2
                destinoImagen = "7"
                destinoTexto = "No todos los pilares son de concreto. Algunos respiran, crecen y guardan silencios que sanan."
                navegar = true
            } else {
                mensajeError = "No es la pista correcta"
            }
            
        case 3:
            if codigo == "imagen_03" {
                destinoNumero = 3
                destinoImagen = "8"
                destinoTexto = "Aquí las ideas se encienden como luciérnagas. Entre pantallas y teclas, nace el futuro."
                navegar = true
            } else {
                mensajeError = "No es la pista correcta"
            }
            
        case 4:
            if codigo == "imagen_04" {
                destinoNumero = 4
                destinoImagen = "9"
                destinoTexto = "Dicen que este edificio es joven, pero sabio. Aquí las voces se graban, se tejen… y cobran vida."
                navegar = true
            } else {
                mensajeError = "No es la pista correcta"
            }
            
        default:
            mensajeError = "Pista desconocida"
        }
        
        // Ocultar mensaje después de 2 segundos
        if mensajeError != nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                mensajeError = nil
            }
        }
    }
}

#Preview {
    VistaCamara(pistaActual: 1)
}
