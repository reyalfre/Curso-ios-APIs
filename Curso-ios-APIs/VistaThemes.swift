//
//  VistaThemes.swift
//  Curso-ios-APIs
//
//  Created by Equipo 8 on 25/2/26.
//

import SwiftUI

struct AppTheme {
    let fondo = Color(.colorFondo)
    let action = Color(.colorAccion)
    let aviso = Color.orange
    let exito = Color.indigo
}
extension Color {
    static let theme = AppTheme()
}

struct VistaThemes: View {
    var body: some View {
        ZStack {
            Color.theme.fondo.ignoresSafeArea()
            VStack {
                Button("Confirmar") {}
                    .padding()
                    .background(Color.theme.action)
                    .foregroundStyle(.white)
                Text("Operación exitosa")
                    .foregroundStyle(Color.theme.exito)
            }
        }
    }
}

#Preview {
    VistaThemes()
}
