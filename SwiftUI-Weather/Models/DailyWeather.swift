//
//  DailyWeather.swift
//  SwiftUI-Weather
//
//  Created by Admin on 4/5/21.
//

import Foundation

struct DailyWeather: Codable, Identifiable {
    var dt: Int
    var temp: Temperature
    var weather: [WeatherDeatail]
    
    enum CodingKey: String {
        case dt
        case temp
        case weather
    }
    
    init() {
        dt = 0
        temp = Temperature(min: 0.0, max: 0.0)
        weather = [WeatherDeatail(main: "", description: "", icon: "")]
    }
}

extension DailyWeather {
    var id: UUID {
        return UUID()
    }
}
