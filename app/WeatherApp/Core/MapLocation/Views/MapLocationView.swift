//
//  MapLocationView.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import SwiftUI
import CoreLocation
import MapKit

struct MapLocationView: View {
    
    @StateObject var vm = MapLocationViewModel()
    
    var body: some View {
        VStack (spacing: 0) {
            TouchLocationWeatherView(weather: vm.weather)
            MapView(annotationLocation: $vm.currentLocation)
        }
    }
}

struct MapLocationView_Previews: PreviewProvider {
    static var previews: some View {
        MapLocationView()
    }
}
