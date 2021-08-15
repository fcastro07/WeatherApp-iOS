//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import Foundation

struct WeatherModel: Codable {
    let timezone: String
    let timezoneOffset: Int
    let current: CurrentWeatherModel
    let daily: [DailyWeatherModel]
    
    enum CodingKeys: String, CodingKey {
        case timezone
        case timezoneOffset = "timezone_offset"
        case current, daily
    }
    
    
}
