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
            ScrollView {
                VStack(alignment: .leading) {
                    TodayWeatherView(weather: weather)
                    Text("Next week")
                        .font(.title)
                        .padding(.top)
                    ForEach(1 ..< weather.daily.count) {
                        WeekWeatherView(weather: weather.daily[$0])
                    }
                }.padding()
            }
        } else {
            ProgressView()
        }
    }
}


struct MyLocationView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = MyLocationViewModel()
        vm.weather = dev.weather
        return MyLocationView(vm: vm)
    }
}
