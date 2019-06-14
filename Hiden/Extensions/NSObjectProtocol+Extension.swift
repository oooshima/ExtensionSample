//
//  NSObjectProtocol+Extension.swift
//  Hiden
//
//  Created by Oshima Haruna on 2019/06/14.
//  Copyright © 2019 Oshima Haruna. All rights reserved.
//

import Foundation

extension NSObjectProtocol {
    
    /**
     クラスのプロパティを全て出力
     
     - ** usage **
     - class Hoge: NSObject {
     - var foo = 1
     - let bar = "bar"
     -  }
     - }
     - Hoge().described // => "foo: 1\nbar: bar"
     */
    public var describedProperty: String {
        let mirror = Mirror(reflecting: self)
        return mirror.children.map { element -> String in
            let key = element.label ?? "Unknown"
            let value = element.value
            return "\(key): \(value)"
            }
            .joined(separator: "\n")
    }
}
