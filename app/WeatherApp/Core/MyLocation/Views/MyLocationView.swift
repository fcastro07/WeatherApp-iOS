//
//  MyLocationView.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import SwiftUI

struct MyLocationView: View {
    
    @EnvironmentObject private var vm: MyLocationViewModel
    
    var body: some View {
        VStack() {
            if(vm.weather.count > 0) {
                TodayWeatherView(weather: vm.weather[0])
            }
            
//                TodayWeatherView(weather: DeveloperPreview.instance.weather)
            
        }
    }
}

struct MyLocationView_Previews: PreviewProvider {
    static var previews: some View {
        MyLocationView().environmentObject(dev.myLocationVM)
    }
}
