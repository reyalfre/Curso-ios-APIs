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
struct WebView: UIViewRepresentable {
    let content: WebContent

    func makeUIView(context: Context) -> WKWebView {
        //Configuracion
        let config = WKWebViewConfiguration()
        config.allowsInlinePredictions = true
        return WKWebView(frame: .zero, configuration: config)
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        switch content {
        case .link(let uRL):
            if uiView.url != uRL {
                let request = URLRequest(url: uRL)
                uiView.load(request)
            }
        case .localHtml(let string):
            uiView.loadHTMLString(string, baseURL: nil)
        }
    }
}
struct VistaWebKit: View {
    //  let webContent = WebContent.link(URL(string: "https://www.google.com")!)
    let webContent = WebContent.localHtml(
        """
        <html>
            <head>
        <style>
            
        </style>
            </head>
        <body>
            <h1>Hola!</h1>
            <p>Esto es HTML renderizado.</p>
            <button onclick="alert('¡Pulsado!')">Púlsame</button>
        </body>
        </html>
        """
    )
    var body: some View {
        WebView(content: webContent)
    }
}

#Preview {
    VistaWebKit()
}
