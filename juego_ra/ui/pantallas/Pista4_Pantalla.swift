import SwiftUI

struct PantallaPista4: View {
    @State private var mostrarCamara = false
    
    var body: some View {
        ZStack {
            Image("6")
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
                    
                    // TÍTULO DE LA PISTA
                    Text("Edificio de Tejedores y Grabaciones")
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
                    Dicen que es el pilar más joven, lleno de vida y siempre despierto. 
                    Aquí los tejedores crean sin ruido, las grabaciones fluyen sin problema, 
                    y las manzanas… no se comen.
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
        .navigationTitle("Pista 4")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $mostrarCamara) {
            VistaCamara(pistaActual: 4)
        }
    }
}
