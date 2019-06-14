//
//  UIImage+Extension.swift
//  Hiden
//
//  Created by Oshima Haruna on 2019/06/14.
//  Copyright © 2019 Oshima Haruna. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    /**
     特定の色で塗りつぶされたUIImageを生成
     
     - ** usage **
     - UIImage(color: .red, size: .init(width: 100, height: 100))
     */
    public convenience init(color: UIColor, size: CGSize) {
        UIGraphicsBeginImageContext(size)
        guard let context: CGContext = UIGraphicsGetCurrentContext() else {
            self.init()
            return
        }
        
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        guard let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
            self.init()
            return
        }
        UIGraphicsEndImageContext()
        
        if let cgImage = image.cgImage {
            self.init(cgImage: cgImage)
        } else {
            self.init()
        }
    }
    
    /**
     画像を別の色で塗りつぶす (透明色は塗りつぶさない)
     
     - ** usage **
     - fooImage.image(withTint: .red)
     */
    func image(withTint color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        
        guard let context: CGContext = UIGraphicsGetCurrentContext(), let cgImage = cgImage else {
            return UIImage()
        }
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -self.size.height)
        context.clip(to: rect, mask: cgImage)
        context.setFillColor(color.cgColor)
        context.fill(rect)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return UIImage()
        }
        UIGraphicsEndImageContext()
        
        return image
    }
}
