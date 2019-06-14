//
//  String+Extension.swift
//  Hiden
//
//  Created by Oshima Haruna on 2019/06/14.
//  Copyright © 2019 Oshima Haruna. All rights reserved.
//

import Foundation

extension String {
    /**
     NSLocalizedStringを使いやすくする
     
     - ** usage **
     - let message = "Hello".localized
     */
    public var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    public func localized(withTableName tableName: String? = nil, bundle: Bundle = Bundle.main, value: String = "") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: value, comment: self)
    }
    
    /**
     様々なRangeで部分文字列を取得
     
     - ** usage **
     - let string = "0123456789"
     - string[0...5] //=> "012345"
     - string[1...3] //=> "123"
     - string[3..<7] //=> "3456"
     - string[...4]  //=> "01234
     - string[..<4]  //=> "0123"
     - string[4...]  //=> "456789"
     */
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
    
    subscript (bounds: PartialRangeUpTo<Int>) -> String {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[startIndex..<end])
    }
    
    subscript (bounds: PartialRangeThrough<Int>) -> String {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[startIndex...end])
    }
    
    subscript (bounds: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        return String(self[start..<endIndex])
    }
    
    /**
     全角/半角文字列の変換
     
     - ** usage **
     - let string = "１２3ＡＢcdeあいう"
     - string.halfWidth //=> "123ABcdeあいう"
     - string.fullWidth //=> "１２３ＡＢｃｄｅあいう"
     */
    public var halfWidth: String {
        return transformFullWidthToHalfWidth(reverse: false)
    }
    
    public var fullWidth: String {
        return transformFullWidthToHalfWidth(reverse: true)
    }
    
    private func transformFullWidthToHalfWidth(reverse: Bool) -> String {
        let string = NSMutableString(string: self) as CFMutableString
        CFStringTransform(string, nil, kCFStringTransformFullwidthHalfwidth, reverse)
        return string as String
    }
    
    /**
     文字列からURLを作成/文字列リテラルからURLを生成
     
     - ** usage **
     - if let url = "https://example.com".url {}
     - let url: URL = "https://example.com"
     */
    public var url: URL? {
        return URL(string: self)
    }
    
}

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        guard let url = URL(string: value) else {
            fatalError("\(value) is an invalid url")
        }
        self = url
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(stringLiteral: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.init(stringLiteral: value)
    }
}
