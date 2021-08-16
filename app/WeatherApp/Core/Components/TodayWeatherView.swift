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
                    Text(weather.current.temp.asDegreesFormat())
                        .bold()
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                    Text("Feels like \(weather.current.feelsLike.asDegreesFormat())")
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                }
                Spacer()
                VStack {
                    Image(weather.current.weather[0].icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                    Text("\(weather.current.weather[0].main)")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
            }
        }
        .groupBoxStyle(TodayWeatherGroupBoxStyle())
    }
}

struct TodayWeatherGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                configuration.label
                    .font(.system(size: 27).bold())
                    .foregroundColor(.white)
                Spacer()
            }
            configuration.content
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color.theme.cardBackground))
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodayWeatherView(weather: dev.weather)
            .previewLayout(.sizeThatFits)
    }
}

