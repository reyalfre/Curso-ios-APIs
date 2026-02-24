//
//  VistaPhotoPicker.swift
//  Curso-ios-APIs
//
//  Created by Equipo 8 on 24/2/26.
//

import PhotosUI
import SwiftUI

struct VistaPhotoPicker: View {
    @State private var fotoSeleccionada: PhotosPickerItem?
    @State private var imagenSeleccionada: Image?
    var body: some View {
        VStack {
            if let imagenSeleccionada {
                imagenSeleccionada.resizable().scaledToFit().frame(height: 300)
            }
            PhotosPicker(
                "Seleccionamos foto",
                selection: $fotoSeleccionada,
                matching: .images
            )
            .onChange(of: fotoSeleccionada) {
                Task {
                    if let data = try? await fotoSeleccionada?.loadTransferable(
                        type: Data.self
                    ),
                        let uiImage = UIImage(data: data)
                    {
                        imagenSeleccionada = Image(uiImage: uiImage)
                    }
                }
            }
        }
    }
}

#Preview {
    VistaPhotoPicker()
}
