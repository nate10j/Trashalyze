//
//  AnalyzeView.swift
//  Trashalyze
//
//  Created by Nathan Jang on 4/16/25.
//

import SwiftUI

struct AnalyzeView: View {
    @Binding var cameraManager: CameraManager
    
    var body: some View {
        if let image = cameraManager.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .clipped()
        } else {
            // Placeholder for when no image is available
            Image(systemName: "camera")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray)
                .padding(50)
            Text("No image captured")
        }
    }
}

#Preview {
    @Previewable @State var cameraManager = CameraManager()
    AnalyzeView(cameraManager: $cameraManager)
}
