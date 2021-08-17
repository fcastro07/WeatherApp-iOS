//
//  PreviewProvider.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import Foundation
import SwiftUI
import MapKit

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    let myLocationViewModel = MyLocationViewModel()
    
    @State var currentLocation: CLLocationCoordinate2D? = CLLocationCoordinate2D(latitude: 200, longitude: 122)
    
    let weather = WeatherModel(
        current: CurrentWeatherModel(
            temp: 34.38,
            feelsLike: 36.95,
            weather: [
                WeatherInfoModel(
                    main: "Clouds",
                    weatherDescription: "broken clouds",
                    icon: "04d"
                )
            ]),
        daily: [
            DailyWeatherModel(
                dt: 1629050400,
                temp: DailyTemperatureModel(
                    day: 30.96,
                    min: 21.47,
                    max: 32.33
                ),
                weather: [
                    WeatherInfoModel(
                        main: "Rain",
                        weatherDescription: "light rain",
                        icon: "10d"
                    )
                ]
            ),
            DailyWeatherModel(
                dt: 1629136800,
                temp: DailyTemperatureModel(
                    day: 31.92,
                    min: 20.33,
                    max: 32.34
                ),
                weather: [
                    WeatherInfoModel(
                        main: "Clouds",
                        weatherDescription: "few clouds",
                        icon: "02d"
                    )
                ]
            ),
            DailyWeatherModel(
                dt: 1629223200,
                temp: DailyTemperatureModel(
                    day: 33.13,
                    min: 21.99,
                    max: 33.13
                ),
                weather: [
                    WeatherInfoModel(
                        main: "Clear",
                        weatherDescription: "clear sky",
                        icon: "01d"
                    )
                ]
            ),
            DailyWeatherModel(
                dt: 1629309600,
                temp: DailyTemperatureModel(
                    day: 34.22,
                    min: 22.84,
                    max: 35.78
                ),
                weather: [
                    WeatherInfoModel(
                        main: "Rain",
                        weatherDescription: "light rain",
                        icon: "10d"
                    )
                ]
            ),
            DailyWeatherModel(
                dt: 1629396000,
                temp: DailyTemperatureModel(
                    day: 34.42,
                    min: 23.53,
                    max: 36.82
                ),
                weather: [
                    WeatherInfoModel(
                        main: "Rain",
                        weatherDescription: "light rain",
                        icon: "10d"
                    )
                ]
            ),
            DailyWeatherModel(
                dt: 1629482400,
                temp: DailyTemperatureModel(
                    day: 34.66,
                    min: 24.2,
                    max: 36.7
                ),
                weather: [
                    WeatherInfoModel(
                        main: "Clouds",
                        weatherDescription: "broken clouds",
                        icon: "04d"
                    )
                ]
            ),
            DailyWeatherModel(
                dt: 1629568800,
                temp: DailyTemperatureModel(
                    day: 35.43,
                    min: 24.8,
                    max: 35.43
                ),
                weather: [
                    WeatherInfoModel(
                        main: "Clouds",
                        weatherDescription: "overcast clouds",
                        icon: "04d"
                    )
                ]
            ),
        ])
}
