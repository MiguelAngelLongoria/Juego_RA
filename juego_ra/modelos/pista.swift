//
//  pista.swift
//  juego_ra
//
//  Created by Miguel Angel Longoria Granados on 05/11/25.
//
import CoreLocation
import SwiftUICore

struct Pista: Identifiable {
    let ubicacion: CLLocation
    var distancia_minima: Double = 5.0     // muy cerca
    var distancia_maxima: Double = 80.0    // distancia aceptable
    let id: String
    let cuerpo: CuerpoPista
    var imagenURL: URL?
    
    /// Porcentaje de distancia entre mínimo y máximo (para mostrar progreso)
    func calcular_porcentaje(ubicacion: CLLocation?) -> Double? {
        guard let ubicacion else { return nil }
        
        let distancia = ubicacion.distance(from: self.ubicacion)
        
        // Limitar valores al rango [0%, 100%]
        if distancia <= distancia_minima { return 0 }
        if distancia >= distancia_maxima { return 100 }
        
        return (distancia - distancia_minima) * 100 / (distancia_maxima - distancia_minima)
    }
    
    /// Estás DENTRO del rango permitido (para ver la pista)
    func esta_en_rango(ubicacion: CLLocation?) -> Bool {
        guard let ubicacion else { return false }
        let distancia = ubicacion.distance(from: self.ubicacion)
        return distancia <= distancia_maxima   // correcto
    }
    
    /// Estás lo suficientemente CERCA para activar o recoger la pista
    func puede_ser_recogida(ubicacion: CLLocation?) -> Bool {
        guard let ubicacion else { return false }
        let distancia = ubicacion.distance(from: self.ubicacion)
        return distancia <= distancia_minima   // correcto
    }
}
