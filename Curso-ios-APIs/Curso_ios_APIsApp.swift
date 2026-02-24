//
//  Curso_ios_APIsApp.swift
//  Curso-ios-APIs
//
//  Created by Equipo 8 on 24/2/26.
//

import SwiftUI
import TipKit

@main
struct Curso_ios_APIsApp: App {
    init() {
        try? Tips.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
