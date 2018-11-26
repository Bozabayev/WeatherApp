//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Rauan on 11/26/18.
//  Copyright © 2018 Rauan. All rights reserved.
//


import  Moya


let api_key = "22821786-a883-47f6-9711-189d849e238d"



enum WeatherService {
    case weatherDetail(lat: Double, lon: Double)
}



extension WeatherService : TargetType {
    var baseURL: URL {
        return URL(string: "https://api.weather.yandex.ru/v1/")!
    }
    
    var path: String {
        switch self {
        case .weatherDetail:
            return "forecast?"
        }
    }
    
    var method: Method {
        switch self {
        case .weatherDetail:
            return .get
        
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .weatherDetail(let lat, let lon):
            return .requestParameters(parameters: ["lat" : lat, "lon" : lon], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["X-Yandex-API-Key" : "\(api_key)"]
    }
    
    
}
