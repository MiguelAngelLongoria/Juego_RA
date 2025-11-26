//
//  juego_raApp.swift
//  juego_ra
//
//  Created by Miguel Angel Longoria Granados on 05/11/25.
//
import SwiftUI

@main
struct juego_raApp: App {
    @State var controlador_juego = ControladorJuego()
    
    var body: some Scene {
        WindowGroup {
            
            /*Pantalla_principal()
                .environment(controlador_juego)*/
            PantallaPista()
        }
    }
}
