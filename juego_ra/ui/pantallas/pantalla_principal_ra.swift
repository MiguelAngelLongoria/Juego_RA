//
//  pantalla_principal_ra.swift
//  juego_ra
//
//  Created by alumno on 11/7/25.
//
import SwiftUI
 
struct Pantalla_principal: View {
    @State var provedor_ubicacion = ServicioUbicacion()
    var body: some View {
        Text("Pistas y donde encontrarlas")
            NavigationStack{
                ForEach(pistas){ pista in
                    if (pista.puede_ser_recogida(
                        ubicacion: provedor_ubicacion.ubicacion_actual)
                    ){
                        NavigationLink{
                            Text("pantalla pista")
                        } label:{
                            Text("Presiona para ir a la pista\(pista.id)").padding(20).background(Color.blue).border(Color.black).cornerRadius(10)
                        }.buttonStyle(.plain).padding(10)
                    }
                    else if (pista.esta_en_rango(
                        ubicacion: provedor_ubicacion.ubicacion_actual)){
                        if let porcentaje = pista.calcular_porcentaje(ubicacion: provedor_ubicacion.ubicacion_actual){
                            Text("distancia en porcentaje: \(porcentaje)")
                            switch(porcentaje){
                            case 1...10:
                                Text("Te estas quemando ")
                            case 11...20:
                                Text("Te estas quemando ")
                            case 21...30:
                                Text("Te estas quemando ")

                            default:
                                Text("Muy lejos")
                            }
                        }
                    }
                    else{
                        Text("no se pudo obtener la distacncia por favor comprobar la conexion del gps")
                    }
                }
            }
        }

}
 
#Preview {
    Pantalla_principal()
}
