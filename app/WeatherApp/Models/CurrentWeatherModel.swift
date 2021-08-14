//
//  CurrentWeatherModel.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import Foundation

struct CurrentWeatherModel: Codable {
    let temp: Double
    let feelsLike: Double
    let weather: [WeatherInfoModel]
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case weather
    }
}
