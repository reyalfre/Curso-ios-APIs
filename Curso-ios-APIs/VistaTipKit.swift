//
//  VistaTipKit.swift
//  Curso-ios-APIs
//
//  Created by Equipo 8 on 24/2/26.
//

import SwiftUI
import TipKit

struct TipFavorito: Tip {
    var title: Text { Text("Guardar favoritos") }
    var message: Text? { Text("Pulsa aquí para guardar lugares favoritos") }
    var image: Image? { Image("tip") }
}
struct VistaTipKit: View {
    let tipFavorito = TipFavorito()
    var body: some View {
        VStack {
            Image(
                systemName: "star"
            ).font(.largeTitle)
                .popoverTip(tipFavorito)
                .onTapGesture {
                    tipFavorito.invalidate(reason: .actionPerformed)
                }
        }
        // En caso de que no funcione en el Canvas:
//        .task {
//            try? Tips.configure()
//        }
    }
}

#Preview {
    VistaTipKit()
}
