//
//  MyLocationViewModel.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import Foundation
import Combine

class MyLocationViewModel: ObservableObject {
    
    @Published var weather: [WeatherModel] = []
    
    private let dataService = WeatherDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        dataService.$weather
            .sink { (returnedWeather) in
                self.weather = returnedWeather
            }
            .store(in: &cancellables)
    }
}
