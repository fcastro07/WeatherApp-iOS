//
//  TodayWeatherView.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import SwiftUI

struct TodayWeatherView: View {
    
    let weather: WeatherModel
    
    var body: some View {
        GroupBox(label: Text("Today")) {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(String(format:"%.0f", weather.current.temp))°")
                        .bold()
                        .font(.system(size: 40))
                    Text("Feels like \(String(format:"%.0f", weather.current.feelsLike))°")
                        .font(.system(size: 15))
                }
                Spacer()
                VStack {
                    Image("001-cloud")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70, alignment: .center)
                    Text("\(weather.current.weather[0].main)")
                }
            }
        }
        .padding()
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodayWeatherView(weather: dev.weather)
            .previewLayout(.sizeThatFits)
    }
}

