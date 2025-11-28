//
//  import SwiftUIPista1_pantalla.swift
//  juego_ra
//
//  Created by Miguel Angel Longoria Granados on 28/11/25.
//
import SwiftUI

struct PantallaPista1: View {
    @State private var mostrarCamara = false
    
    var body: some View {
        
        ZStack {
            
            Image("3")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 28) {
                    
                    // Ícono principal
                    Image(systemName: "cup.and.heat.waves")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.brown)
                        .shadow(radius: 12)
                        .padding()
                        .background(Color.white.opacity(0.55))
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2))
                    
                    // TÍTULO
                    Text("Pista 1: Noche en el café")
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
                    
                    // DESCRIPCIÓN
                    Text("""
                    Donde el aroma despierta a los hambreados. 
                    No solo rugen los estómagos: también las billeteras tiemblan, 
                    aunque el sabor apenas alcanza. 
                    Tu pista te espera en la entrada.
                    """)
                        .font(.custom("Didot", size: 22))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(18)
                        .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.white.opacity(0.5)))
                        .padding(.horizontal, 20)
                    
                    // BOTÓN
                    Button("Comenzar Búsqueda") {
                        mostrarCamara = true
                    }
                    .modifier(BotonBusqueda())
                    .padding(.horizontal, 40)
                    
                }
                .padding(.vertical, 40)
            }
        }
        .navigationTitle("Pista 1")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $mostrarCamara) {
            VistaCamara(pistaActual: 1)
        }
    }
}
