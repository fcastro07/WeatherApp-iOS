//
//  TouchLocationWeatherView.swift
//  WeatherApp
//
//  Created by Facundo Castro on 17/8/21.
//

import SwiftUI

struct TouchLocationWeatherView: View {
    
    let weather: WeatherModel?
    
    var body: some View {
        if let weather = weather {
            GroupBox(label: Text(weather.daily[0].dt.asWeekday())) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(weather.daily[0].temp.day.asDegreesFormat())
                            .bold()
                            .font(.system(size: 35))
                        HStack {
                            Text("↑\(weather.daily[0].temp.max.asDegreesFormat())")
                                .font(.system(size: 13))
                            Text("↓\(weather.daily[0].temp.min.asDegreesFormat())")
                                .font(.system(size: 13))
                        }
                    }
                    Spacer()
                    VStack {
                        Image(weather.daily[0].weather[0].icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60, alignment: .center)
                        Text("\(weather.daily[0].weather[0].main)")
                            .font(.system(size: 15))
                    }
                }
            }.padding()
        } else {
            Text("Touch anywere to see the weather")
                .bold()
                .padding()
        }
    }
}

struct TouchLocationWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TouchLocationWeatherView(weather: dev.weather)
            .previewLayout(.sizeThatFits)
    }
}
