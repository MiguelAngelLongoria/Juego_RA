//
//  pantalla_info.swift
//  juego_ra
//
//  Created by Miguel Angel Longoria Granados on 20/11/25.
//

import SwiftUI

// Pantalla principal
struct PantallaPista: View {
    var body: some View {
        NavigationStack {
            ZStack {
           
                Image("3")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
               
                
                Spacer()
            
                VStack(spacing: 25) {
                    Image(systemName: "gamecontroller.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.yellow)
                        .shadow(color: .yellow, radius: 10)
                        .padding(50)
                    
                  
                    Text("Bienvenido a la Búsqueda Artística")
                        .font(.custom("Didot", size: 40))
                        .foregroundColor(.black)
                        .padding()
                        .shadow(color: .cyan, radius: 6)
                        .background(
                            LinearGradient(colors: [.cyan, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.blue, lineWidth: 3)
                        )
                        .cornerRadius(15)
                        .padding(.horizontal, 40)
                    
                    
                
                    Text("Las pinturas de Van Gogh han cobrado vida. Camina entre sus colores, encuentra los puntos marcados en el mapa y revela los secretos que dejó escondidos en su arte.Cada ubicación te acercará a un fragmento perdido de sus historias: los vientos que recorren los campos de trigo, las luces que danzan en la noche estrellada y los tonos cálidos que protegen sus girasoles eternos.")
                        .font(.custom("Didot", size: 22))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(50)
                        .background(Color.blue.opacity(0.55))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.blue.opacity(0.7), lineWidth: 2)
                        )
                        .cornerRadius(14)
                        .padding(.horizontal, 50)
                        .shadow(radius: 5)
                        .padding(50)
                    Spacer()

                    NavigationLink(destination: Pantalla_principal()) {
                        Text("Comenzar la Aventura")
                            .font(.custom("Didot", size: 30))
                            .frame(width: 330, height: 80)
                            .background(
                                LinearGradient(colors: [.yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .foregroundColor(.black)
                            .cornerRadius(14)
                            .shadow(color: .yellow.opacity(0.8), radius: 10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                  
                    
                }
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
    PantallaPista()
}
