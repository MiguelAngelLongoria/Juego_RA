//
//  camara.swift
//  juego_ra
//
//  Created by Miguel Angel Longoria Granados on 12/11/25.
//

import SwiftUI

struct VistaCamara: View {
    @State var servicio_camara = ServicioCamara()
    
    
    
    
    var body: some View {
        ZStack{
            GeometryReader{ _ in
                Camara_pantallita(capa_sesion: servicio_camara.obtener_previsualizacion_camara())
                    .ignoresSafeArea()
            }
        }
        .onAppear {
            servicio_camara.codigoDetectado = { codigo in
                print("Código detectado:", codigo)
            }
            servicio_camara.iniciar()
        }

        .onDisappear{
            servicio_camara.detener()
        }
    }
}

#Preview {
    VistaCamara()
}

