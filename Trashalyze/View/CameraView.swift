//
//  CameraView.swift
//  Trashalyze
//
//  Created by Nathan Jang on 4/14/25.
//

import SwiftUI
import UIKit
import AVFoundation

struct CameraView: View {
    @State private var cameraManager = CameraManager()
    var body: some View {
        CameraPreview(source: cameraManager.captureSession)
    }
}
#Preview {
    CameraView()
}
