//
//  CIImage+Extension.swift
//  Trashalyze
//
//  Created by Nathan Jang on 4/15/25.
//

import CoreImage

extension CIImage {
    
    var cgImage: CGImage? {
        let ciContext = CIContext()
        
        guard let cgImage = ciContext.createCGImage(self, from: self.extent) else {
            return nil
        }
        
        return cgImage
    }
    
}
