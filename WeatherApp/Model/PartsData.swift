//
//  PartsData.swift
//  WeatherApp
//
//  Created by Rauan on 11/26/18.
//  Copyright © 2018 Rauan. All rights reserved.
//

import Foundation
import  ObjectMapper



class  PartsData : Mappable {
    
    var dayShort : WeatherDetail?
    var nightShort: WeatherDetail?
    
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        dayShort <- map["day_short"]
        nightShort <- map["night_short"]
    }
    
    
    
    
}
