//
//  ContentView.swift
//  SwiftUI-Weather App
//
//  Created by ADPopov on 12.01.2024.
//

import SwiftUI

private struct WeatherInfo: Identifiable {
    var id: String { weekDay }
    let weekDay: String
    let icon: String
    let temp: String
}

private let weatherArray: [WeatherInfo] = [
    WeatherInfo(weekDay: "TUE", icon: "cloud.sun.fill", temp: "+20°C"),
    WeatherInfo(weekDay: "WED", icon: "sun.max.fill", temp: "+25°C"),
    WeatherInfo(weekDay: "THU", icon: "wind", temp: "+15°C"),
    WeatherInfo(weekDay: "FRI", icon: "sunset.fill", temp: "+15°C"),
    WeatherInfo(weekDay: "SAT", icon: "moon.stars.fill", temp: "+14°C"),
]

// Представление для иконок
private struct WeatherIconView: View {
    let iconName: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(systemName: iconName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
    }
}

// Представление для текстов
private struct TextView: View {
    let text: String
    let fontSize: CGFloat
    
    init(text: String, fontSize: CGFloat = 16) {
        self.text = text
        self.fontSize = fontSize
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: fontSize, weight: .medium))
            .foregroundColor(.white)
    }
}

// Представление дня недели
private struct WeatherDayView: View {
    let weatherInfo: WeatherInfo
    
    var body: some View {
        VStack {
            TextView(text: weatherInfo.weekDay)
            WeatherIconView(iconName: weatherInfo.icon,
                            width: 40,
                            height: 40)
            TextView(text: weatherInfo.temp)
        }
    }
}

// Представление для фона
private struct BackgroundView: View {
    let topColor: Color
    let bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            
            VStack {
                TextView(text: "Cupertino, CA", fontSize: 32)
                
                VStack(spacing: 10) {
                    WeatherIconView(iconName: weatherArray[0].icon, width: 180, height: 180)
                    TextView(text: weatherArray[0].temp, fontSize: 70)
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    ForEach(weatherArray) { weatherInfo in
                        WeatherDayView(weatherInfo: weatherInfo)
                    }
                }
                
                Spacer()
                
                ButtonView(label: "Change Day Time",
                           textColor: .blue,
                           backgroundColor: .white)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
