//
//  Pantalla_Imagenes.swift
//  juego_ra
//
//  Creado por Miguel Angel Longoria Granados
//

import SwiftUI

struct PantallaImagen: View {
    
    /// Número de pista que se quiere mostrar (1–4)
    var numero: Int
    
    /// Nombre de la imagen en Assets a mostrar
    var imagen: String
    
    /// Texto que acompaña la pista
    var texto: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // Título
                Text("¡Pista \(numero) encontrada!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
                // Imagen — estilo bonito
                Image(imagen)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .cornerRadius(12)
                    .shadow(radius: 6)
                    .padding(.horizontal)
                
                // Texto de la pista
                Text(texto)
                    .font(.title3)
                    .italic()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Mensaje final
                Text("¡Sigue investigando!")
                    .font(.headline)
                    .padding(.bottom, 30)
            }
        }
        .navigationTitle("Pista \(numero)")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    PantallaImagen(
        numero: 1,
        imagen: "6",
        texto: "Dicen que cada átomo de nuestro cuerpo fue parte de una estrella."
    )
}
