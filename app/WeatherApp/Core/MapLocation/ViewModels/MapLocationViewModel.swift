//
//  MapLocationViewModel.swift
//  WeatherApp
//
//  Created by Facundo Castro on 16/8/21.
//

import Foundation
import CoreLocation
import MapKit
import Combine

class MapLocationViewModel: ObservableObject {
    
    @Published var weather: WeatherModel? = nil
    @Published var currentLocation: CLLocationCoordinate2D?
    
    private let dataService = WeatherDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
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
        
        $currentLocation.sink { [weak self] (location) in
            guard let self = self else {
                return
            }
            
            guard let location = location else {
                return
            }
            
            self.dataService.updateWeather(forLocation: CLLocation(latitude: location.latitude, longitude: location.latitude))
        }
        .store(in: &cancellables)
    }
}

