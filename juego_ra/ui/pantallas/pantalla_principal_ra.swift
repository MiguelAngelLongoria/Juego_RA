//
//  Pantalla_principal.swift
//  juego_ra
//
//  Corrección completa por Miguel
//

import SwiftUI
import CoreLocation

struct Pantalla_principal: View {
    @State var proveedor_ubicacion = ServicioUbicacion()
    
    var body: some View {
        ZStack {
            Image("2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 25) {
                // PANEL DE UBICACIÓN
                if let ubicacion = proveedor_ubicacion.ubicacion_actual {
                    VStack(spacing: 4) {
                        Text("📍 Tu ubicación actual")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text("Latitud: \(ubicacion.coordinate.latitude)")
                            .foregroundColor(.white.opacity(0.9))
                            .font(.subheadline)

                        Text("Longitud: \(ubicacion.coordinate.longitude)")
                            .foregroundColor(.white.opacity(0.9))
                            .font(.subheadline)
                    }
                    .padding(10)
                    .background(Color.black.opacity(0.45))
                    .cornerRadius(12)
                    .padding(.bottom, 10)
                }

                
                // Título
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
                    .background(Color.blue.opacity(0.7))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.yellow.opacity(0.7), lineWidth: 2)
                    )
                    .cornerRadius(14)
                    .padding(.horizontal)
                
                NavigationStack {
                    VStack(spacing: 22) {
                        ForEach(Array(pistas.enumerated()), id: \.element.id) { index, pista in
                            
                            VStack(spacing: 8) {
                                
                                // ESTADO 1 — LEJOS
                                if !pista.esta_en_rango(ubicacion: proveedor_ubicacion.ubicacion_actual) {
                                    // Distancia a esta pista
                                    if let userLoc = proveedor_ubicacion.ubicacion_actual {
                                        let distancia = userLoc.distance(from: pista.ubicacion)
                                        
                                        Text(String(format: "Distancia a esta pista: %.1f metros", distancia))
                                            .font(.caption)
                                            .foregroundColor(.white.opacity(0.85))
                                            .padding(6)
                                            .background(Color.black.opacity(0.25))
                                            .cornerRadius(8)
                                    }

                                    Text("🖼️ No estás cerca de la pista \(index + 1)")
                                        .foregroundColor(.white.opacity(0.75))
                                        .padding(10)
                                        .background(Color.black.opacity(0.3))
                                        .cornerRadius(10)
                                    
                                } else {
                                    
                                    // ESTADO 2 — EN RANGO NORMAL (mostrar botón)
                                    NavigationLink {
                                        switch index {
                                        case 0: PantallaPista1()
                                        case 1: PantallaPista2()
                                        case 2: PantallaPista3()
                                        case 3: PantallaPista4()
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
                                    }
                                    
                                    // ESTADO 3 — MUY CERCA (≤ distancia_minima)
                                    if pista.puede_ser_recogida(ubicacion: proveedor_ubicacion.ubicacion_actual) {
                                        
                                        HStack {
                                            Image(systemName: "qrcode.viewfinder")
                                                .foregroundColor(.green)
                                            Text("¡Ya puedes escanear la pista!")
                                                .font(.headline)
                                                .foregroundColor(.green)
                                        }
                                        .padding(8)
                                        .background(Color.white.opacity(0.8))
                                        .cornerRadius(12)
                                        .shadow(radius: 5)
                                        .padding(.top, -10)
                                    }
                                }
                            }
                            .padding(.bottom, 12)
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.bottom, 40)
        }
    }
}


/// MODIFICADOR para botones de pista, para evitar repetir código visual
struct BotonPista: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Didot", size: 36))
            .frame(width: 300, height: 100)
            .background(
                LinearGradient(colors: [.yellow, .orange],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            )
            .foregroundColor(.black)
            .border(Color.black)
            .cornerRadius(14)
            .shadow(color: .yellow.opacity(0.7), radius: 8)
            .padding(22)
    }
}
struct PantallaPista1: View {
    @State private var mostrarCamara = false
    
    var body: some View {
        ZStack {
            Image("3")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                Image(systemName: "cup.and.heat.waves")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.brown)
                    .shadow(radius: 12)
                    .padding()
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2))
                
                Text("Pista 1: Noche en el café")
                    .font(.custom("Didot", size: 40))
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .border(Color.black)
                    .cornerRadius(20)

                Text("Donde el aroma despierta a los hambreados. No solo rugen los estómagos: también las billeteras tiemblan, aunque el sabor apenas alcanza. Tu pista te espera en la entrada.")
                    .font(.custom("Didot", size: 22))
                    .padding()
                    .background(Color.white.opacity(0.55))
                    .cornerRadius(18)
                    .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.black.opacity(0.7)))
                    .padding(30)

                Button("Comenzar Búsqueda") { mostrarCamara = true }
                    .modifier(BotonBusqueda())

            }
            .navigationTitle("Pista 1")
            .sheet(isPresented: $mostrarCamara) {
                VistaCamara(pistaActual: 1)
            }
        }
    }
}

struct PantallaPista2: View {
    @State private var mostrarCamara = false
    
    var body: some View {
        ZStack {
            Image("7")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                
                Image(systemName: "tree.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.green)
                    .shadow(radius: 12)
                    .padding()
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2))

                Text("Pista 2: El Árbol del Umbral")
                    .font(.custom("Didot", size: 40))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .border(Color.black)

                Text("No todos los pilares son de concreto. Algunos respiran, y nos permiten respirar. Tu seña será verde como un semáforo y café como la tierra que lo sostiene.")
                    .font(.custom("Didot", size: 22))
                    .padding()
                    .background(Color.white.opacity(0.55))
                    .cornerRadius(18)
                    .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.black.opacity(0.7)))
                    .padding(30)

                Button("Comenzar Búsqueda") { mostrarCamara = true }
                    .modifier(BotonBusqueda())
            }
            .navigationTitle("Pista 2")
            .sheet(isPresented: $mostrarCamara) {
                VistaCamara(pistaActual: 2)
            }
        }
    }
}

struct PantallaPista3: View {
    @State private var mostrarCamara = false
    
    var body: some View {
        ZStack {
            Image("9")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                
                Image(systemName: "desktopcomputer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.gray)
                    .shadow(radius: 12)
                    .padding()
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2))

                Text("Pista 3: El Arte de las Computadoras")
                    .font(.custom("Didot", size: 40))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .border(Color.black)

                Text("Aquí se mezclan diseñadores e ingenieros; aquí las materias se invierten como un reflejo en el agua. Sigue donde el conocimiento cambia de forma.")
                    .font(.custom("Didot", size: 22))
                    .padding()
                    .background(Color.white.opacity(0.55))
                    .cornerRadius(18)
                    .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.black.opacity(0.7)))
                    .padding(30)

                Button("Comenzar Búsqueda") { mostrarCamara = true }
                    .modifier(BotonBusqueda())
            }
            .navigationTitle("Pista 3")
            .sheet(isPresented: $mostrarCamara) {
                VistaCamara(pistaActual: 3)
            }
        }
    }
}

struct PantallaPista4: View {
    @State private var mostrarCamara = false
    
    var body: some View {
        ZStack {
            Image("6")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                
                Image(systemName: "hanger")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.gray)
                    .shadow(radius: 12)
                    .padding()
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(20)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 2))

                Text("Edificio de Tejedores y Grabaciones")
                    .font(.custom("Didot", size: 40))
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .border(Color.black)

                Text("Dicen que es el pilar más joven, lleno de vida y siempre despierto. Aquí los tejedores crean sin ruido, las grabaciones fluyen sin problema, y las manzanas… no se comen.")
                    .font(.custom("Didot", size: 22))
                    .padding()
                    .background(Color.white.opacity(0.55))
                    .cornerRadius(18)
                    .overlay(RoundedRectangle(cornerRadius: 18).stroke(Color.black.opacity(0.7)))
                    .padding(30)

                Button("Comenzar Búsqueda") { mostrarCamara = true }
                    .modifier(BotonBusqueda())
            }
            .navigationTitle("Pista 4")
            .sheet(isPresented: $mostrarCamara) {
                VistaCamara(pistaActual: 4)
            }
        }
    }
}

struct BotonBusqueda: ViewModifier {
    func body(content: Content) -> some View {
        content
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
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(.black, lineWidth: 2))
    }
}

#Preview {
    Pantalla_principal()
}
