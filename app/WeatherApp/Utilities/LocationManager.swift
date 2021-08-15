//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Facundo Castro on 15/8/21.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    
    let manager = CLLocationManager()
    
    var completition: ((CLLocation) -> Void)?
    
    public func getUserLocation(completition: @escaping ((CLLocation) -> Void)) {
        self.completition = completition
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        completition?(location)
        manager.stopUpdatingLocation()
    }
}
