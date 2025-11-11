//
//  pantalla_principal_ra.swift
//  juego_ra
//
//  Created by alumno on 11/7/25.
//
import SwiftUI

struct PantallaPrincipal: View{
    @State var proveedor_ubicacion = ServicioUbicacion()
    
    
    var body: some View{
        NavigationStack{
            ForEach(pistas){ pista in
                if(pista.puede_ser_recogida(
                    ubicacion: proveedor_ubicacion.ubicacion_actual)
                    ){
                    NavigationLink{
                        Text("Esta es la pantalla de la pista. ")
                    } label: {
                        Text("Puchopicame para ir a la pista \(pista.id)")
                    }
                    .buttonStyle(.plain)
                }
                else if(pista.esta_en_rango(
                    ubicacion: proveedor_ubicacion.ubicacion_actual)
                    ){
                    if let porcentaje = pista.calcular_porcentaje(ubicacion: proveedor_ubicacion.ubicacion_actual){
                        Text("Distancia en porcentaje \(porcentaje)")
                        switch(porcentaje){
                            case 1...10:
                                NavigationLink{
                                    Text("Esta es la pantalla de la pista. ")
                                } label: {
                                    Text("Puchopicame para ir a la pista \(pista.id)")
                                }
                                .buttonStyle(.plain)
                            case 11...20:
                                Text("Te estas acercando")
                            case 21...30:
                                Text("Estas acercandote")
                            default:
                                Text("Muy lejos")
                        }
                    }
                }
                
                
                else {
                    Text("NO se puede obtener la distancia, comprueba tu conexion con el gps")
                }

                
            }
        }
    }
}

#Preview {
    PantallaPrincipal()
}
