//
//  FactData.swift
//  WeatherApp
//
//  Created by Rauan on 11/26/18.
//  Copyright © 2018 Rauan. All rights reserved.
//

import Foundation
import ObjectMapper



class FactData : Mappable {
    
    var temp : Int?
    var icon : String?
    var condition : String?
    
    
    required init?(map: Map) {
    }
    
func mapping(map: Map) {
        temp <- map["temp"]
        icon <- map["icon"]
        condition <- map["condition"]
    }
    
    
    
    
    
    
    
    
    
}
