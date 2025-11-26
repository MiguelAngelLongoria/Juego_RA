//
//  controlador_juego.swift
//  juego_ra
//
//  Created by Miguel Angel Longoria Granados on 20/11/25.
//

import Foundation
import SwiftUI

@Observable
class ControladorJuego{
    
    var pistas_encontradas = [Pista]()
    
    
    func el_usuario_encontro_pista(pista: Pista){
        pistas_encontradas.append(pista)
    }
    
}
