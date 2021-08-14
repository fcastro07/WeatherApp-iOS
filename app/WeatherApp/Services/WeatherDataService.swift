//
//  WeatherDataService.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import Foundation
import Combine

class WeatherDataService {
    
    @Published var weather: [WeatherModel] = []
    var weatherSubscription: AnyCancellable?
    
    init() {
        getWeather()
    }
    
    private func getWeather() {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=minutely,hourly,alerts&units=metric&appid=6381d4a8de095849e3374a1a7cab0286") else { return }
        
        
        weatherSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (ouput) -> Data in
                
                guard let response = ouput.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return ouput.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: WeatherModel.self, decoder: JSONDecoder())
            .sink { (completition) in
                switch completition {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnedWeather) in
                self?.weather.append(returnedWeather)
                self?.weatherSubscription?.cancel()
            }
        
    }
}
