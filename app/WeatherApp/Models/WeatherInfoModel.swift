//
//  WeatherInfoModel.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import Foundation

struct WeatherInfoModel: Codable {
    let main, weatherDescription, icon: String
    
    enum CodingKeys: String, CodingKey {
        case main
        case weatherDescription = "description"
        case icon
    }
}
