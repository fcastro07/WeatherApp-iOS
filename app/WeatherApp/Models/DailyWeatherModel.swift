//
//  DailyWeatherModel.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import Foundation

struct DailyWeatherModel: Codable {
    let dt: Int64
    let temp: DailyTemperatureModel
    let weather: [WeatherInfoModel]
    
    enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case weather
    }
}
