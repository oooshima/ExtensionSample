//
//  Array+Extension.swift
//  Hiden
//
//  Created by Oshima Haruna on 2019/06/14.
//  Copyright © 2019 Oshima Haruna. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    
    /**
     配列でオブジェクトのインスタンスを検索して削除
     
     - ** usage **
     - var array = ["foo", "bar"]
     - array.remove(element: "foo")
     - array //=> ["bar"]
     */
    @discardableResult
    public mutating func remove(element: Element) -> Index? {
        guard let index = firstIndex(of: element) else { return nil }
        remove(at: index)
        return index
    }
    
    @discardableResult
    public mutating func remove(elements: [Element]) -> [Index] {
        return elements.compactMap { remove(element: $0) }
    }
}

extension Array where Element: Hashable {
    /**
     配列から同一の値を削除
     
     - ** usage **
     - var array = [1, 2, 3, 3, 2, 1, 4]
     - array.unify() // [1, 2, 3, 4]
     */
    public mutating func unify() {
        self = unified()
    }
}

extension Collection where Element: Hashable {
    public func unified() -> [Element] {
        return reduce(into: []) {
            if !$0.contains($1) {
                $0.append($1)
            }
        }
    }
}
