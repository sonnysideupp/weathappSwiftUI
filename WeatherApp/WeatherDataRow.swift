//
//  WeatherDataRow.swift
//  WeatherApp
//
//  Created by Sonny Huang on 8/11/20.
//  Copyright © 2020 Sonny Huang. All rights reserved.
//

import SwiftUI

struct WeatherDataRow: View {
    var weatherData: WeatherData

    var body: some View {
        HStack {
            weatherData.iconimage?
            .resizable()
            .frame(width: 50, height: 50)
            Text(weatherData.summary ?? "")
            Text((weatherData.temperature ?? "") + "F")
            Text(weatherData.time ?? "")
        }
    }
}


