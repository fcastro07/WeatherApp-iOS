//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Facundo Castro on 14/8/21.
//

import SwiftUI

@main
struct WeatherApp: App {
    
    @StateObject var vm = MyLocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(vm)
        }
    }
    
}
