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
    
    @State var showAnalyzeView: Bool = false
    @State var photoButtonPressed: Bool = false
    
    var body: some View {
        if showAnalyzeView {
            HStack {
                Button(action: {
                    showAnalyzeView = false
                    photoButtonPressed = false
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
            AnalyzeView(cameraManager: $cameraManager)
        } else {
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
                    Button (action: {
                        photoButtonPressed = true
                        cameraManager.takePhoto {
                            DispatchQueue.main.async {
                                showAnalyzeView = true
                            }
                        }
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
                    }).disabled(photoButtonPressed)
                }
            }
        }
    }
}
