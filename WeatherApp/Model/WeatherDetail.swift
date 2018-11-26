//
//  WeatherDetail.swift
//  WeatherApp
//
//  Created by Rauan on 11/26/18.
//  Copyright © 2018 Rauan. All rights reserved.
//

import Foundation
import ObjectMapper



class WeatherDetail : Mappable {
    
    var temp : Int?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        temp <- map["temp"]
    }
    
    
    
    
    
    
    
}
