//
//  MyLocationViewModel.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import Foundation
import Combine
import CoreLocation

class MyLocationViewModel: ObservableObject {
    
    @Published var weather: WeatherModel? = nil
    
    private let dataService = WeatherDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
        updateWeather()
    }
    
    private func addSubscribers() {
        dataService.$weather
            .sink { [weak self] (returnedWeather) in
                guard let self = self else {
                    return
                }
                
                self.weather = returnedWeather
            }
            .store(in: &cancellables)
    }
    
    private func updateWeather() {
        LocationManager.shared.getUserLocation() { [weak self] location in
            DispatchQueue.main.async {
                guard let self = self else {
                    return
                }
                
                self.dataService.updateWeather(forLocation: location)
            }
        }
    }
}
