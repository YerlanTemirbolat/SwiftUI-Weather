//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Admin on 4/6/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    @State private var searchTerm = "Moscow"
    
    var city: String
    var date: String
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                HStack {
                    TextField("", text: $searchTerm)
                        .padding(.leading, 20)
                    
                    Button {
                        cityVM.city = searchTerm
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue.opacity(0.5))
                            
                            Image(systemName: "location.fill")
                        }
                    }
                    .frame(width: 40, height: 40)
                    
                }
                .foregroundColor(.white)
                .padding()
                .background(ZStack (alignment: .leading) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.5))
                })
                .padding()
                
                HStack {
                    VStack(alignment: .center, spacing: 10) {
                        Text(city)
                            .font(.title)
                            .bold()
                        Text(date)
                    }
                    .foregroundColor(.white)
                }
                
                VStack(spacing: 10) {
                    Text("Today")
                        .font(.largeTitle)
                        .bold()
                    HStack(spacing: 20) {
                        Lottie(name: cityVM.getLottieAnimationFor(icon: cityVM.weatherIcon))
                            .frame(width: 100, height: 100)
                        
                        VStack(alignment: .leading) {
                            Text("\(cityVM.temperature)°C")
                                .font(.system(size: 42))
                            Text(cityVM.conditions)
                        }
                    }
                    
                    HStack {
                        Spacer()
                        widgetView(image: "wind", color: .green, title: "\(cityVM.windSpeed)mi/hr")
                        Spacer()
                        widgetView(image: "drop.fill", color: .blue, title: "\(cityVM.humidity)")
                        Spacer()
                        widgetView(image: "umbrella.fill", color: .red, title: "\(cityVM.rainChances)")
                        Spacer()
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
                .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
                .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
                .padding()
                
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 10) {
                        WeatherDayView(daily: CityViewViewModel())
                    }
                })
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
    }
}


private func widgetView(image: String, color: Color, title: String) -> some View {
    VStack {
        Image(systemName: image)
            .padding()
            .font(.title)
            .foregroundColor(color)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        Text(title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cityVM: CityViewViewModel(), city: "", date: "")
    }
}

