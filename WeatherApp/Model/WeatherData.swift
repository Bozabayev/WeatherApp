//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Rauan on 11/26/18.
//  Copyright © 2018 Rauan. All rights reserved.
//

import Foundation
import ObjectMapper




class WeatherData: Mappable {
   
    
    
    var now_dt = "now_dt"
    var fact : FactData?
    var foreCast = [ForeCastData]()

    
    required init?(map: Map) {

    }
    
    func mapping(map: Map) {
        now_dt <- map["now_dt"]
        fact <- map["fact"]
        foreCast <- map["forecasts"]
    }
    
    
    
    
    
    
    
    
}
