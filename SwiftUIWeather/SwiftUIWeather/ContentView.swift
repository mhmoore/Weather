//
//  ContentView.swift
//  SwiftUIWeather
//
//  Created by Michael Moore on 1/17/22.
//

import SwiftUI

struct ContentView: View {
    let days = ["TUE", "WED", "THU", "FRI", "SAT", "SUN"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Denver, CO")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    WeatherDayView(day: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(day: "WED", imageName: "wind", temperature: 68)
                    WeatherDayView(day: "THU", imageName: "snowflake", temperature: 8)
                    WeatherDayView(day: "FRI", imageName: "cloud.bolt.rain.fill", temperature: 65)
                    WeatherDayView(day: "SAT", imageName: "cloud.rain.fill", temperature: 67)
                    WeatherDayView(day: "SUN", imageName: "sun.max.fill", temperature: 102)
                }
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(10)
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
    var day: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(day)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
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
