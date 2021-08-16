//
//  WeekWeatherView.swift
//  WeatherApp
//
//  Created by Facundo Castro on 15/8/21.
//

import SwiftUI

struct WeekWeatherView: View {
    
    let weather: DailyWeatherModel
    
    var body: some View {
        GroupBox(label: Text(weather.dt.asWeekday())) {
            HStack {
                VStack(alignment: .leading) {
                    Text(weather.temp.day.asDegreesFormat())
                        .bold()
                        .font(.system(size: 35))
                    HStack {
                        Text("↑\(weather.temp.max.asDegreesFormat())")
                            .font(.system(size: 13))
                        Text("↓\(weather.temp.min.asDegreesFormat())")
                            .font(.system(size: 13))
                    }
                }
                Spacer()
                VStack {
                    Image(weather.weather[0].icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60, alignment: .center)
                    Text("\(weather.weather[0].main)")
                        .font(.system(size: 15))
                }
            }
        }
    }
}



struct WeekWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeekWeatherView(weather: dev.weather.daily[0])
            .previewLayout(.sizeThatFits)
    }
}
