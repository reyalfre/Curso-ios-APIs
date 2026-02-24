//
//  VistaHaptics.swift
//  Curso-ios-APIs
//
//  Created by Equipo 8 on 24/2/26.
//

import SwiftUI

struct VistaHaptics: View {
    @State private var contador = 0
    @State private var errorTrigger = false
    var body: some View {
        Button("Incrementar: \(contador)") {
            contador += 1
        }
        .sensoryFeedback(
            .impact(weight: .medium, intensity: 1.0),
            trigger: contador
        )
        Button("Simular error") {
            errorTrigger.toggle()
        }
        .sensoryFeedback(.error, trigger: errorTrigger)
    }
}

#Preview {
    VistaHaptics()
}
