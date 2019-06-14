//
//  UIColor+Extension.swift
//  Hiden
//
//  Created by Oshima Haruna on 2019/06/14.
//  Copyright © 2019 Oshima Haruna. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    /**
     16進数でUIColorの作成
     
     - ** usage **
     - let color = UIColor(hex: 0xAABBCC)
     */
    public convenience init(hex: Int, alpha: Double = 1.0) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
    
    /**
     一つのプロジェクトで使う色数を入れとく
     
     - ** usage **
     - UIColor.iq.pink         // #fa4664
     - UIColor.iq.textBlack    // #333333
     */
    public struct iq {  // プロジェクトに合わせた名前で良い
        public static let pink: UIColor = UIColor(hex: 0xfa4664)
        public static let textBlack: UIColor = UIColor(hex: 0x333333)
    }
}
