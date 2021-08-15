//
//  ContentView.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MyLocationView()
                .tabItem {
                    Image(systemName: "location")
                    Text("My location")
                }
            MapLocationView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map location")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
