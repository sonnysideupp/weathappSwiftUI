//
//  Observer.swift
//  WeatherApp
//
//  Created by Sonny Huang on 8/11/20.
//  Copyright © 2020 Sonny Huang. All rights reserved.
//

import Foundation

class Observer : ObservableObject{
    
    @Published var weatherModel = [WeatherData]()
    
    init(_ longitude: String, _ latitude: String) {
        getWeatherData(longitude,latitude)
        print("getweather")
    }
    
    
    func getWeatherData(_ longitude: String, _ latitude: String){
        WeatherAPIManager.WeatherRequestGetUrl(latitude,longitude, success:{
            (responseDictionary) in
            print( responseDictionary)
            if responseDictionary.count > 0 {
                for i in 0..<responseDictionary.count{
                    let jsondic = responseDictionary[i]
                    self.weatherModel.append(WeatherData(dictionary: jsondic))
                    
                    
                }
            }
            
         })
    }
    
    
    
}
