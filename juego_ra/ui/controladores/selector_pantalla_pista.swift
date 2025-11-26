//
//  selector_pantalla_pista.swift
//  juego_ra
//
//  Created by Miguel Angel Longoria Granados on 10/11/25.

import SwiftUI

struct SelectorPantallaPista : View {
    
    var pista_Id: String
    @State var pista_actual : Pista? = nil
    
    var body: some View {
        Text("Hola mundo")
            .onAppear{
                obtener_pista()
            }
        switch pista_actual?.cuerpo{
        case let de_informacion as PistaInformacion:PantallaPistaInformacion(cuerpo_pista: de_informacion)
        case let de_interaccion as PistaInteractuable:PantallaPistaInteractuable(cuerpo_pista: de_interaccion)
                                                         default: Text("nada")
        }
    
    }
    
    func obtener_pista(){
        for pista in pistas {
            if pista.id == pista_Id {
                pista_actual = pista
                break
            }
        }
        print("la pista actual es\(pista_actual)")
    }
    
}

#Preview {
    SelectorPantallaPista(pista_Id: "pista_1")
}
