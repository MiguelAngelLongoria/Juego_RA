//
//  Pista3_Pantalla.swift
//  juego_ra
//
//  Created by Miguel Angel Longoria Granados on 28/11/25.
//
import SwiftUI


struct PantallaPista3: View {
    @State private var mostrarCamara = false
    
    var body: some View {
        ZStack {
            Image("9")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 28) {
                    
                    // Ícono principal
                    Image(systemName: "hanger")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.gray)
                        .shadow(radius: 12)
                        .padding()
                        .background(Color.white.opacity(0.55))
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2))

                Text("Pista 3: El Arte de las Computadoras")
                        .font(.custom("Didot", size: 40))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white.opacity(0.7), lineWidth: 2)
                        )
                        .padding(.horizontal)
                    
                    Text("Aquí se mezclan diseñadores e ingenieros; aquí las materias se invierten como un reflejo en el agua. Sigue donde el conocimiento cambia de forma.")
                        .font(.custom("Didot", size: 22))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(18)
                        .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white.opacity(0.5)))
                        .padding(.horizontal, 20)
                    
                    Button("Comenzar Búsqueda") {
                        mostrarCamara = true
                    }
                    .modifier(BotonBusqueda())
                    .padding(.horizontal, 40)
                    
                }
                .padding(.vertical, 40)
            }
        }
        .navigationTitle("Pista 3")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $mostrarCamara) {
            VistaCamara(pistaActual: 3)
        }
    }
}

