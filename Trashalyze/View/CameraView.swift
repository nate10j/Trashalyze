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
    @Binding var selectedTabIndex: Int
    @Binding var cameraManager: CameraManager
    

    
    var body: some View {
        ZStack {
            CameraPreview(source: cameraManager.captureSession)
            
            VStack {
                HStack {
                    Button(action: {
                        cameraManager.captureSession.stopRunning()
                        self.selectedTabIndex = 0
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:26, height:26)
                            .foregroundColor(.white)
                            .padding(28)
                    })
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    Task {
                        await cameraManager.startSession()
                    }
                    self.selectedTabIndex = 1
                }, label: {
                    Image(systemName: "camera")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width:30, height:30)
                            .foregroundColor(.white)
                            .padding(28)
                            .background(Color.green)
                            .clipShape(Circle())
                })
            }
        }
    }
}
