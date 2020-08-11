//
//  ContentView.swift
//  WeatherApp
//
//  Created by Sonny Huang on 8/11/20.
//  Copyright © 2020 Sonny Huang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var observed = Observer("-76.495682","38.978291")
    init() {

//        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Helvetica", size: 12)!]
    }
    
    
    
    
    var body: some View {
        NavigationView{
           
            List(observed.weatherModel){
                i in
                WeatherDataRow(weatherData: i)
                }
            .navigationBarTitle(Text("Weather App for Annapolis, MD").font(.subheadline), displayMode: .inline)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
