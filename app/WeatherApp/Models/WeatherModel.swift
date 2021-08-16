//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import Foundation

struct WeatherModel: Codable {
    let current: CurrentWeatherModel
    let daily: [DailyWeatherModel]
    
    enum CodingKeys: String, CodingKey {
        case current, daily
    }
}
