//
//  Double.swift
//  WeatherApp
//
//  Created by Facundo Castro on 15/8/21.
//

import Foundation

extension Double {
    
    func asDegreesFormat() -> String {
        return "\(String(format:"%.0f", self))°"
    }
    
    func asWeekday() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let weekDay = dateFormatter.string(from: date)
        return weekDay
    }
}
