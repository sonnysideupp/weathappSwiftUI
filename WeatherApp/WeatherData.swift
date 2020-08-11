//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Sonny Huang on 8/11/20.
//  Copyright © 2020 Sonny Huang. All rights reserved.
//

import Foundation
import SwiftUI

public class WeatherData: Identifiable{
    
    public var time : String?
    public var summary : String?
    public var icon : String?
    public var temperature : String?
    public var iconimage: Image?
    
    private func convertUTCToLocal(_ dateString: Double) -> String? {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "UTC")
        let UTCDate = Date(timeIntervalSince1970: dateString)
        
        formatter.dateFormat = "MM-dd hh:mm a"
        print(dateString)
        formatter.timeZone = TimeZone.current
        let localDateString = formatter.string(from: UTCDate ?? Date())
        print(localDateString)
        return localDateString
        
        
    }
    
    required public init (dictionary: Dictionary<String, AnyObject?>){
        
        let timedouble = dictionary["time"] as? Double
        time = convertUTCToLocal(timedouble ?? 0)
        summary = dictionary["summary"] as? String
        icon = dictionary["icon"] as? String
        let tempint = dictionary["temperature"] as? Double
        temperature = String(describing: tempint!)
        iconimage = Image(icon ?? "")
    
    }
    
    
    
}
