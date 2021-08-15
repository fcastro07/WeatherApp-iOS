//
//  MyLocationView.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import SwiftUI

struct MyLocationView: View {
    
    @StateObject var vm = MyLocationViewModel()
    
    var body: some View {
        
        if let weather = vm.weather {
            TodayWeatherView(weather: weather)
        } else {
            ProgressView()
        }
    }
}


struct MyLocationView_Previews: PreviewProvider {
    static var previews: some View {
        MyLocationView()
    }
}
