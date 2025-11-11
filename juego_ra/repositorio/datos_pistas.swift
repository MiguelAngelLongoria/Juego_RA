//
//  datos_pistas.swift
//  juego_ra
//
//  Created by Miguel Angel Longoria Granados on 05/11/25.
//
import CoreLocation

let pistas = [
    Pista(
        ubicacion: CLLocation(latitude: 31.74255425245735, longitude: -106.43351434558254),
        id: "Pista_1",
        cuerpo: PistaInformacion(informacion: "pista 1")
    ),
    Pista(
        ubicacion: CLLocation(
            latitude: 31.74203075546911,
            longitude: -106.43239807913027
        ),
        id: "pista_2",
        cuerpo: PistaInteractuable(
            informaicon: "texto de prueba para la pantalla intreactuable",
            interacciones: [
                Boton(
                    mensaje: "puhcipicame oara ir a ala pista 1",
                    conecta_con_pista: "pista_1")
                
            ]
        )
    ),
    Pista(
        ubicacion: CLLocation(latitude: 31.742659689531497, longitude: -106.43034203443862),
        id: "Pista_3",
        cuerpo: PistaInformacion(informacion: "pista 3")
    ),
    Pista(
        ubicacion: CLLocation(latitude: 31.74193271764058, longitude: -106.43201564859191),
        id: "Pista_4",
        cuerpo: PistaInformacion(informacion: "pista 4")
    ),
    Pista(
        ubicacion: CLLocation(latitude: 31.74335313128695, longitude: -106.43149654656239),
        id: "Pista_5",
        cuerpo: PistaInformacion(informacion: "pista 5")
    ),
    
]
