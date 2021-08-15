//
//  WeatherDataService.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import Foundation
import Combine
import CoreLocation

class WeatherDataService {
    
    @Published var weather: WeatherModel? = nil
    var weatherSubscription: AnyCancellable?
    
    func updateWeather(forLocation location: CLLocation) {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&exclude=minutely,hourly,alerts&units=metric&appid=6381d4a8de095849e3374a1a7cab0286") else { return }
        
        
        weatherSubscription = NetworkingManager.download(url: url)
            .decode(type: WeatherModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedWeather) in
                self?.weather = returnedWeather
                self?.weatherSubscription?.cancel()
            })
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        
        return output.data
    }
}
