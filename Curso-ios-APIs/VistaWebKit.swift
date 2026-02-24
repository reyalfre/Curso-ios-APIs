//
//  VistaWebKit.swift
//  Curso-ios-APIs
//
//  Created by Equipo 8 on 24/2/26.
//

import SwiftUI
import WebKit

enum WebContent {
    case link(URL)
    case localHtml(String)
}
struct WebView: UIViewRepresentable{
    let content: WebContent
    
    func makeUIView(context: Context) -> WKWebView {
        //Configuracion
        let config = WKWebViewConfiguration()
        config.allowsInlinePredictions = true
        return WKWebView(frame: .zero, configuration: config)
    }
}
struct VistaWebKit: View {
    var body: some View {
    }
}

#Preview {
    VistaWebKit()
}
