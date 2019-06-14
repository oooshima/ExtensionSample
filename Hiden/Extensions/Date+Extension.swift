//
//  Date+Extension.swift
//  Hiden
//
//  Created by Oshima Haruna on 2019/06/14.
//  Copyright © 2019 Oshima Haruna. All rights reserved.
//

import Foundation

private let formatter: DateFormatter = {
    let formatter: DateFormatter = DateFormatter()
    formatter.timeZone = NSTimeZone.system
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.calendar = Calendar(identifier: .gregorian)
    return formatter
}()

extension Date {
    
    /**
     Date→String
     
     - ** usage **
     - Date().string(format: "yyyy/MM/dd") // 2017/02/26
     */
    func string(format: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> String {
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    /**
     String → Date
     
     - ** usage **
     - Date(dateString: "2016-02-26T10:17:30Z")  // Date
     */
    init?(dateString: String, dateFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ") {
        formatter.dateFormat = dateFormat
        guard let date = formatter.date(from: dateString) else { return nil }
        self = date
    }
}

