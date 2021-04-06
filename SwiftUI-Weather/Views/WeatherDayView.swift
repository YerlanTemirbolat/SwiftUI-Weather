//
//  WeatherDayView.swift
//  SwiftUI-Weather
//
//  Created by Admin on 4/6/21.
//

import SwiftUI

struct WeatherDayView: View {
    
    @ObservedObject var daily: CityViewViewModel
    
    var body: some View {
        ForEach(daily.weather.daily) { weather in
            LazyHStack {
                dailyCell(weather: weather)
            }
        }
    }
    private func dailyCell(weather: DailyWeather) -> some View {
        VStack {
            Text(daily.getDayFor(timestamp: weather.dt).uppercased())
                .frame(width: 50)
            Spacer()
            Text("\(daily.getTempFor(temp: weather.temp.max)) | \(daily.getTempFor(temp: weather.temp.min))°C")
            Spacer()
            daily.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
        }
        .foregroundColor(.white)
        .padding(.horizontal)
        .padding(.vertical)
        .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.blue]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

struct WeatherDayView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDayView(daily: CityViewViewModel())
    }
}
