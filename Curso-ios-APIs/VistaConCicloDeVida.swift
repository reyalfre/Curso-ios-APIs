//
//  VistaConCicloDeVida.swift
//  Curso-ios-APIs
//
//  Created by Equipo 8 on 24/2/26.
//

import SwiftUI

struct VistaConCicloDeVida: View {
    @Environment(\.scenePhase) var scenePhase
    var body: some View {
        Text( "Observamos cambios en la app")
            .onChange(of: scenePhase) { oldValue, newValue in
                switch newValue {
                case .active:
                    print("La app está activa")
                case .inactive:
                    print("La app está inactiva")
                case .background:
                    print("La app está en segundo plano")
                default:
                    break
                }
            }
    }
}

#Preview {
    VistaConCicloDeVida()
}
