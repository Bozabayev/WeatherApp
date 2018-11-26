//
//  Constants.swift
//  WeatherApp
//
//  Created by Rauan on 11/26/18.
//  Copyright © 2018 Rauan. All rights reserved.
//

import Foundation



public let weatherCondition : [String : String] = [
    "clear" : "ясно",
    "partly-cloudy" : "малооблачно",
    "cloudy" : "облачно с прояснениями",
    "overcast" : "пасмурно",
    "partly-cloudy-and-light-rain" : "небольшой дождь",
    "partly-cloudy-and-rain" : "дождь",
    "overcast-and-rain" : "сильный дождь",
    "overcast-thunderstorms-with-rain" : "сильный дождь, гроза",
    "cloudy-and-light-rain" : "небольшой дождь",
    "overcast-and-light-rain" : "небольшой дождь",
    "cloudy-and-rain" : "дождь",
    "overcast-and-wet-snow" : "дождь со снегом",
    "partly-cloudy-and-light-snow" : "небольшой снег",
    "partly-cloudy-and-snow" : "снег",
    "overcast-and-snow" : "снегопад",
    "cloudy-and-light-snow" : "небольшой снег",
    "overcast-and-light-snow" : "небольшой снег",
    "cloudy-and-snow" : "снег"
]



public let DaysOfWeek = [
    "Воскресенье",
    "Понедельник",
    "Вторник",
    "Среда",
    "Четверг",
    "Пятница",
    "Суббота",
    "Воскресенье",
    "Понедельник"
]

public let MonthOfYear = [
    "декабря",
    "января",
    "февраля",
    "марта",
    "апреля",
    "мая",
    "июня",
    "июля",
    "августа",
    "сентября",
    "октября",
    "ноября",
    "декабря"
]



let date = Date()
let calendar = Calendar.current
let month = calendar.component(.month, from: date)
let day = calendar.component(.day, from: date)


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
