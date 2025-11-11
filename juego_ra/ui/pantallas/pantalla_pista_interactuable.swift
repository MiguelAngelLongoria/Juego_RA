//
//  pantalla_pista_interactuable.swift
//  juego_ra
//
//  Created by Miguel Angel Longoria Granados on 10/11/25.
//

import SwiftUI

struct PantallaPïstaInformacion: View {
    var cuerpo_pista : PistaInformacion
    
    var body: some View {
        Text(cuerpo_pista.informacion)
        
    }
}
