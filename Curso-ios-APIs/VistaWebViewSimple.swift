//
//  VistaWebViewSimple.swift
//  Curso-ios-APIs
//
//  Created by Equipo 8 on 24/2/26.
//

import SwiftUI
import SafariServices
// Necesitamos un adaptador entre UIKit y SwiftUI para el navegador
struct safariWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController
    
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = false
        return SFSafariViewController(url: url, configuration: config)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}
struct VistaWebViewSimple: View {
    let url = URL(string: "https://www.google.com")!
    @State private var mostrarSheet = false
    var body: some View {
        Button("Abrir página web aparte"){
            mostrarSheet = true
        }
        .fullScreenCover(isPresented: $mostrarSheet){
            safariWrapper(url: url)
        }
       safariWrapper(url: url)
            .frame(maxWidth: .infinity)
            .frame(height: 350)
    }
}

#Preview {
    VistaWebViewSimple()
}
