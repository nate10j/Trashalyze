//
//  CameraManager.swift
//  Trashalyze
//
//  Created by Nathan Jang on 4/15/25.
//

import SwiftUI
import Foundation
import AVFoundation

class CameraManager: NSObject {
    let captureSession = AVCaptureSession()
    var image: UIImage?
    private var deviceInput: AVCaptureDeviceInput?
    private var output: AVCapturePhotoOutput?
    private var sessionQueue = DispatchQueue(label: "session.queue")
    
    private var isAuthorized: Bool {
        get async {
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            
            // Determine if the user previously authorized camera access.
            var isAuthorized = status == .authorized
            
            // If the system hasn't determined the user's authorization status,
            // explicitly prompt them for approval.
            if status == .notDetermined {
                isAuthorized = await AVCaptureDevice.requestAccess(for: .video)
            }
            
            return isAuthorized
        }
    }
    
    override init() {
        super.init()
        
        Task {
            await configureSession()
        }
    }
    
    private func configureSession() async {
        guard await isAuthorized
        else { return }
        
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                        for: .video, position: .back) else { return }
        let deviceInput = try? AVCaptureDeviceInput(device: device)
        
        captureSession.beginConfiguration()
        
        defer {
            self.captureSession.commitConfiguration()
        }
        
        output = AVCapturePhotoOutput()
        
        guard captureSession.canAddInput(deviceInput!) else {
            print("Unable to add device input to capture session.")
            return
        }
        
        guard captureSession.canAddOutput(output!) else {
            print("Unable to add video output to capture session.")
            return
        }
        
        captureSession.addInput(deviceInput!)
        captureSession.addOutput(output!)
    }
    
    func startSession() async {
        guard await isAuthorized else { return }

        captureSession.startRunning()
    }
    
    func takePhoto() {
        guard let photoOutput = self.output else { return }
        
        sessionQueue.async {
            var photoSettings = AVCapturePhotoSettings()


            if photoOutput.availablePhotoCodecTypes.contains(.hevc) {
                photoSettings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.hevc])
            }
            
            let isFlashAvailable = self.deviceInput?.device.isFlashAvailable ?? false
            photoSettings.flashMode = isFlashAvailable ? .auto : .off
            photoSettings.maxPhotoDimensions = CMVideoDimensions(width: 200, height: 200)
            if let previewPhotoPixelFormatType = photoSettings.availablePreviewPhotoPixelFormatTypes.first {
                photoSettings.previewPhotoFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPhotoPixelFormatType]
            }
            photoSettings.photoQualityPrioritization = .balanced
            
            photoOutput.capturePhoto(with: photoSettings, delegate: self)
        }
    }
}

extension CameraManager: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
        image = UIImage(data: imageData)
    }
}
