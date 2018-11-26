//
//  ForeCastData.swift
//  WeatherApp
//
//  Created by Rauan on 11/26/18.
//  Copyright © 2018 Rauan. All rights reserved.
//

import Foundation
import  ObjectMapper




class ForeCastData : Mappable {
    
    var date : String?
    var parts : PartsData?
    
    required init?(map: Map) {
    }
    
     func mapping(map: Map) {
        date <- map["date"]
        parts <- map["parts"]
    }

    
    
    
    
    
    
}
