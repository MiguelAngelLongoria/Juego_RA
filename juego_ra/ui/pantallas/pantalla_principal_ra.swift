//
//  pantalla_principal_ra.swift
//  juego_ra
//
//  Created by alumno on 11/7/25.
//
import SwiftUI
 
struct Pantalla_principal: View {
    @State var proveedor_ubicacion = ServicioUbicacion()
    
    var body: some View {
        ZStack {
            Image("2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
          
            
            VStack(spacing: 25) {
                
                // 🖌️ Título estilo pintura
                Text("Pistas entre las Pinturas")
                    .font(.custom("Didot", size: 36))
                    .foregroundColor(.yellow)
                    .padding()
                    .shadow(color: .yellow.opacity(0.9), radius: 3)
                    .background(Color.white)
                    .border(Color.yellow)
                    .cornerRadius(15)
                    .padding(20)
                   
                   
                
              
                Text("Busca las pistas dentro del mundo de Van Gogh")
                    .padding()
                    .foregroundColor(.white)
                    .font(.headline)
                    .background(
                        Color.blue.opacity(0.7)
                            .blur(radius: 3)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.yellow.opacity(0.7), lineWidth: 2)
                    )
                    .cornerRadius(14)
                    .padding(.horizontal)
                
                // Lista de pistas
                NavigationStack {
                    VStack(spacing: 22) {
                        ForEach(Array(pistas.enumerated()), id: \.element.id) { index, pista in
                            
                            if pista.puede_ser_recogida(ubicacion: proveedor_ubicacion.ubicacion_actual) ||
                                pista.esta_en_rango(ubicacion: proveedor_ubicacion.ubicacion_actual) {
                                
                                NavigationLink {
                                    switch index {
                                    case 0: PantallaPista1()
                                    case 1: PantallaPista2()
                                    case 2: PantallaPista3()
                                    default: Text("Pista no disponible")
                                    }
                                } label: {
                                    Text("Pista \(index + 1)")
                                        .font(.custom("Didot", size: 36))
                                        .frame(width: 300, height: 100)
                                        .background(
                                            LinearGradient(
                                                colors: [.yellow, .orange],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                        .foregroundColor(.black)
                                        .border(Color.black)
                                        .cornerRadius(14)
                                        .shadow(color: .yellow.opacity(0.7), radius: 8)
                                        .padding(22)
                                }
                                
                            } else {
                                Text("🖼️ No estás cerca de la pista \(index + 1)")
                                    .foregroundColor(.white.opacity(0.7))
                                    .padding(8)
                                    .background(Color.black.opacity(0.25))
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.bottom, 40)
        }
    }

    }
    

struct PantallaPista1: View {
    @State private var mostrarCamara = false
    var body: some View {
        
        ZStack {
            Image("2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Image(systemName: "tree.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.green)
                    .shadow(color: .green.opacity(0.8), radius: 12)
                    .padding()
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .shadow(radius: 8)
                
                
                Text("Pista 1: El Árbol del Umbral")
                    .font(.custom("Didot", size: 40))
                    .foregroundColor(.black)
                    .padding(20)
                    .background(Color.white)
                    .border(Color.black)
                    .cornerRadius(20)
                
                
                Text("Las pinturas de Van Gogh han despertado, y en esta zona el viento susurra algo extraño entre las hojas. Sigue el camino hasta encontrar un árbol grande cerca de la entrada del parque: ese es el primer punto donde la realidad toca el arte.")
                    .font(.custom("Didot", size: 22))
                    .foregroundColor(.black)
                    .padding(20)
                    .background(Color.white.opacity(0.55))
                    .cornerRadius(18)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color.black.opacity(0.7))
                    )
                    .padding(30)
                
                
                Button(action: {
                    mostrarCamara = true
                }) {
                    Text("Comenzar Búsqueda")
                        .font(.custom("Didot", size: 28))
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(colors: [.yellow, .orange],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
                        )
                        .cornerRadius(14)
                        .shadow(color: .yellow.opacity(0.8), radius: 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(.black, lineWidth: 2)
                        )
                }
                
                
                
                
                .padding()
                /*.background(
                 Image("1")
                 .resizable()
                 .scaledToFill()
                 .ignoresSafeArea()
                 )*/
                .navigationTitle("Pista 1")
                .sheet(isPresented: $mostrarCamara) {
                    VistaCamara()
                }
            }
            
        }
    }
}
    
    
    
    
    
    
    
    
    
    
    struct PantallaPista2: View {
        var body: some View {
            VStack(spacing: 20) {
                VistaCamara()
                Text("Pantalla de Pista 2")
                    .font(.largeTitle)
                Text("🔍 Busca un objeto azul brillante en la plaza central.")
                    .padding()
                    .background(Color.yellow.opacity(0.3))
                    .cornerRadius(12)
                Spacer()
            }
            .navigationTitle("Pista 2")
            .padding()
        }
    }
    
    struct PantallaPista3: View {
        var body: some View {
            VStack(spacing: 20) {
                VistaCamara()
                Text("Pantalla de Pista 3")
                    .font(.largeTitle)
                Text("🔍 Observa las luces rojas cerca de la fuente del parque.")
                    .padding()
                    .background(Color.yellow.opacity(0.3))
                    .cornerRadius(12)
                Spacer()
            }
            .navigationTitle("Pista 3")
            .padding()
        }
    }
    
    struct PantallaPista4: View {
        var body: some View {
            VStack(spacing: 20) {
                VistaCamara()
                Text("Pantalla de Pista 3")
                    .font(.largeTitle)
                Text("🔍 Observa las luces rojas cerca de la fuente del parque.")
                    .padding()
                    .background(Color.yellow.opacity(0.3))
                    .cornerRadius(12)
                Spacer()
            }
            .navigationTitle("Pista 4")
            .padding()
        }
        
        
        
    
}
 
// Preview
#Preview {
    Pantalla_principal()
}
