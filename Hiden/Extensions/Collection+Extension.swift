//
//  Collection+Extension.swift
//  Hiden
//
//  Created by Oshima Haruna on 2019/06/14.
//  Copyright © 2019 Oshima Haruna. All rights reserved.
//

import Foundation

extension Collection {
    /**
     Out of Rangeを防いで、要素を取得
     
     - ** usage **
     - let array = [0, 1, 2]
     - if let item = array[safe: 5] {
     - print("unreachable")
     - }
     */
    public subscript(safe index: Index) -> Element? {
        return startIndex <= index && index < endIndex ? self[index] : nil
    }
}
