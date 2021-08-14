//
//  DailyTemperatureModel.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import Foundation

struct DailyTemperatureModel: Codable {
    let day, min, max: Double
    
    enum CodingKeys: String, CodingKey {
        case day, min, max
    }
}
