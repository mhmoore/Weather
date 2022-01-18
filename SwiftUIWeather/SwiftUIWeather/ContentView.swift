//
//  ContentView.swift
//  SwiftUIWeather
//
//  Created by Michael Moore on 1/17/22.
//

import SwiftUI

enum Day: String {
    case monday = "MON"
    case tuesday = "TUE"
    case wednesday = "WED"
    case thursday = "THU"
    case friday = "FRI"
    case saturday = "SAT"
    case sunday = "SUN"
}

enum WeatherImage: String {
    case moonAndStars = "moon.stars.fill"
    case moon = "moon.fill"
    case cloud = "cloud.fill"
    case snow = "snowflake"
    case sun = "sun.max.fill"
    case sunAndCloud = "cloud.sun.fill"
    case rainAndLightning = "cloud.bolt.rain.fill"
    case rainAndCloud = "cloud.rain.fill"
    case rainAndMoon = "cloud.moon.rain.fill"
    case wind = "wind"
}

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Denver, CO")
                CurrentWeatherView(imageName: isNight ? .moon : .sunAndCloud, temperature: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(day: .tuesday,
                                   imageName: isNight ? .moonAndStars : .sunAndCloud,
                                   temperature: 74)
                    WeatherDayView(day: .wednesday,
                                   imageName: isNight ? .moonAndStars : .wind,
                                   temperature: 68)
                    WeatherDayView(day: .thursday,
                                   imageName: isNight ? .cloud : .snow,
                                   temperature: -8)
                    WeatherDayView(day: .friday,
                                   imageName: isNight ? .moonAndStars : .rainAndLightning,
                                   temperature: 65)
                    WeatherDayView(day: .saturday,
                                   imageName: isNight ? .rainAndMoon : .rainAndCloud,
                                   temperature: 67)
                    WeatherDayView(day: .sunday,
                                   imageName: isNight ? .moon : .sun,
                                   temperature: 102)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(isNight: $isNight, textColor: .blue, backgroundColor: .white)
                }
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var day: Day
    var imageName: WeatherImage
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(day.rawValue)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName.rawValue)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : Color("darkBlue"), isNight ? Color("darkerBlue") : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentWeatherView: View {
    var imageName: WeatherImage
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName.rawValue)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    @Binding var isNight: Bool
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(isNight ? "Day Time" : "Night Time")
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
