//
//  PantallaPista1.swift
//  juego_ra
//
//  Created by Miguel Angel Longoria Granados on 19/11/25.
//

import SwiftUI
import CoreLocation

struct DetallePista: View {
    var pista: Pista

    var body: some View {
        VStack {
            // Título
            Text("Detalles de la Pista \(pista.id)")
                .font(.largeTitle)
                .padding()

            // Mostrar
            Text("Descripción: \(pista.cuerpo.informacion)")
                .padding()

            // Imagen
            AsyncImage(url: pista.imagenURL) { estado in
                switch estado {
                case .empty:
                    ProgressView("Cargando imagen...")
                case .success(let imagen):
                    imagen
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                        .padding(5)
                case .failure(_):
                    Text("Error al cargar la imagen")
                        .foregroundColor(.red)
                @unknown default:
                    EmptyView()
                }
            }
            .padding()

            Spacer()  // Para 
        }
        .padding()
        .navigationTitle("Pista \(pista.id)")
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}

