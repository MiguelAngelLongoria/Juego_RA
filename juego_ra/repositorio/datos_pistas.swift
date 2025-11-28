//
//  datos_pistas.swift
//  juego_ra
//
//  Created by Miguel Angel Longoria Granados on 05/11/25.
//

import CoreLocation

let pistas = [
    Pista(
        ubicacion:
            CLLocation(latitude: 31.7430402136247, longitude: -106.43246030993306),
        
        id: "pista_1",
        cuerpo:
            PistaInformacion(
                informacion: "Texto para mostrar al usario"
            ),
        imagenURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/b4/Vincent_Willem_van_Gogh_128.jpg")
    ),
    
    Pista(
        ubicacion: CLLocation(
            latitude: 31.742664354937443,
            longitude:  -106.43230831667267
            
        ),
        id: "pista_2",
        cuerpo: PistaInteractuable(
            informacion: "Texto de prueba para la pantalla interactuable",
            interacciones: [
                boton(
                    mensaje: "Puchopicame para ir a la pista 1",
                    conecta_con_pista: "pista_1")
            ]
        ),
        imagenURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/b4/Vincent_Willem_van_Gogh_128.jpg")
    ),
    
    Pista(
        ubicacion: CLLocation(
            latitude: 31.743458059637607,
            longitude:  -106.43203773121121,
        
        ),
        id: "pista_3",
        cuerpo: PistaInteractuable(
            informacion: "Texto de prueba para la pantalla interactuable",
            interacciones: [
                boton(
                    mensaje: "Puchopicame para ir a la pista 1",
                    conecta_con_pista: "pista_2")
            ]
        ),
        imagenURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/b4/Vincent_Willem_van_Gogh_128.jpg")
    ),
    
    Pista(
        ubicacion: CLLocation(
            latitude: 31.742127515428756,
            longitude:  -106.4324079446212
            
        ),
        id: "pista_4",
        cuerpo: PistaInteractuable(
            informacion: "Texto de prueba para la pantalla interactuable",
            interacciones: [
                boton(
                    mensaje: "Puchopicame para ir a la pista 1",
                    conecta_con_pista: "pista_3")
            ]
        ),
        imagenURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/b/b4/Vincent_Willem_van_Gogh_128.jpg")
    )
]
  
       
    
    
    
    /*
    
    
    
    Pista(ubicacion: CLLocation(latitude: 31.743900921876357, longitude:  -106.43265971449689),
          id: "pista3",
          cuerpo: PistaInformacion(informacion: "texto ")),
    
    Pista(ubicacion: CLLocation(latitude:  31.74285615813838, longitude: -106.4328928808415),
          id: "pista4",
          cuerpo: PistaInformacion(informacion: "texto ")),
    
    Pista(ubicacion: CLLocation(latitude:  31.742363569955618, longitude:  -106.43358333729007),
          id: "pista5",
          cuerpo: PistaInformacion(informacion: "texto "))
]

     */
