//
//  APIManager.swift
//  WeatherApp
//
//  Created by Sonny Huang on 8/11/20.
//  Copyright © 2020 Sonny Huang. All rights reserved.
//

import Foundation
import Alamofire

class WeatherAPIManager{
    
    class func WeatherRequestGetUrl(_ longitude: String, _ latitude: String, success: @escaping (_ responseDictionary: Array<Dictionary<String, AnyObject?>>) -> Void ){
        let url = APIURL.baseURL +  APIURL.APIKEY + longitude + "," + latitude + APIURL.typeOfData
        
        AF.request(url).responseJSON(completionHandler: {
            (response) in
            //print("data")
            //print(String(data: response.data!, encoding: String.Encoding.utf8)!)
            switch response.result {
            case let .success(value):
              
                let json = value
                if  (json as? [String : AnyObject]) != nil{
                    if let dictionaryArray = json as? Dictionary<String, AnyObject?> {
                      
                        let jsonArray = dictionaryArray["hourly"] as? Dictionary<String, AnyObject?>
                        
                        if let jsonArray = jsonArray?["data"] as? Array<Dictionary<String, AnyObject?>>{
                            success(jsonArray)
                        }
                    }
                    
                    }
                    
                    
                
            case let .failure(error):
                print(error)
            }
            
            
            
        })
    }
    
    
    
}


struct APIURL{
    
    
    static let baseURL = "https://api.darksky.net/forecast/"
    static let APIKEY = "d3fba72e83fc64768952cbf06ee6e5d1/"
    // hourly data
    static let typeOfData = "?exclude=currently,minutely,daily,alerts,flags"

}
