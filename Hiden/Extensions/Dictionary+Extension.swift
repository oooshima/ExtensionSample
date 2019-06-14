//
//  Dictionary+Extension.swift
//  Hiden
//
//  Created by Oshima Haruna on 2019/06/14.
//  Copyright © 2019 Oshima Haruna. All rights reserved.
//

import Foundation

extension Dictionary {
    
    /**
     Dictionary同士を`+`演算子でマージできるようにする
     
     - ** usage **
     - ["key1": 0] + ["key1": 1, "key2": 2]    // ["key2": 2, "key1": 1]
     */
    static public func +<K, V>(lhs: [K: V], rhs: [K: V]) -> [K: V] {
        var lhs = lhs
        for (key, value) in rhs {
            lhs[key] = value
        }
        return lhs
    }
}
