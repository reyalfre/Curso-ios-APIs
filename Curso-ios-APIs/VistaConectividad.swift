//
//  VistaConectividad.swift
//  Curso-ios-APIs
//
//  Created by Equipo 8 on 24/2/26.
//

import Network
import SwiftUI

@Observable
class NetworkMonitor {
    var conectado = true
    var conexionPorDatos = false
    var conecionPorWifi = false
    private let monitor = NWPathMonitor()

    init() {
        monitor.pathUpdateHandler = { path in
            self.conectado = path.status == .satisfied
        }
        monitor.start(queue: DispatchQueue.global())
    }
}
struct VistaConectividad: View {
    @State private var network = NetworkMonitor()
    var body: some View {
        ContentUnavailableView(
            "Estado de red",
            systemImage: network.conectado ? "wifi" : "wifi.slash",
            description: Text(
                network.conectado ? "Estás conectado" : "Sin conexión"
            )
        )
    }
}

#Preview {
    VistaConectividad()
}
