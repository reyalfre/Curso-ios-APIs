//
//  ContentView.swift
//  Curso-ios-APIs
//
//  Created by Equipo 8 on 24/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                NavigationLink(destination: VistaConCicloDeVida()) {
                    Text("Vista con ciclo de vida")
                }
                NavigationLink(destination: VistaPhotoPicker()) {
                    Text("Vista PhotoPicker")
                }
                NavigationLink(destination: VistaCompartir()) {
                    Text("Vista Compartir")
                }
                NavigationLink(destination: VistaTipKit()) {
                    Text("Vista TipKit")
                }
                NavigationLink(destination: VistaHaptics()) {
                    Text("Vista Haptics")
                }
                NavigationLink(destination: VistaConectividad()) {
                    Text("Vista Conectividad")
                }
                NavigationLink(destination: VistaSonidos()) {
                    Text("Vista Sonidos")
                }
                NavigationLink(destination: VistaWebViewSimple()){
                    Text("Vista WebViewSimple")
                }
                NavigationLink(destination: VistaWebKit()){
                    Text("Vista WebKit")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
