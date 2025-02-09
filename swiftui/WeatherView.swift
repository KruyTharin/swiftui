//
//  Background.swift
//  swiftui
//
//  Created by Tharin KRUY on 8/2/25.
//

import SwiftUI

struct WeatherData {
    var imageName: String
    var dayOfTheWeek: String
    var temperature: String
}

struct WeatherView: View{
    
    let weatherData: [WeatherData] = [
           WeatherData(imageName: "cloud.sun.fill", dayOfTheWeek: "Mon", temperature: "25°"),
           WeatherData(imageName: "cloud.sun.rain.fill", dayOfTheWeek: "Tue", temperature: "20°"),
           WeatherData(imageName: "cloud.sun.bolt.fill", dayOfTheWeek: "Wed", temperature: "19°"),
           WeatherData(imageName: "sun.max.fill", dayOfTheWeek: "Thu", temperature: "40°"),
           WeatherData(imageName: "cloud.sun.fill", dayOfTheWeek: "Fri", temperature: "25°"),
           WeatherData(imageName: "cloud.sun.fill", dayOfTheWeek: "Sat", temperature: "25°")
       ]
    
    @State private var isNight = false
    
    
    
    var body: some View{
        ZStack {
            BackGroundColorView (isNight: $isNight)
                
                VStack{
                    Text("Phnom Penh, CAM")
                        .font(.system(size: 32, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .frame(width: 300)
                    
                    CurrentWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: "30°")
                    
                    HStack (spacing: 8){
                        
                        ForEach(weatherData, id: \.dayOfTheWeek){ weather in
                            WeatherOfTheWeekView(
                                weather: weather
                            )
                        }
                    }
                
                    Spacer()
                    
                    Button {
                        isNight.toggle()
                        print("Cliked", isNight)
                    } label: {
                        Text("Change Day Time")
                            .frame(width: 280, height: 50)
                            .background(.white)
                            .font(.system(size: 20, weight: .semibold, design: .default))
                            .cornerRadius(8)
                        
                    }
                    
                    Spacer()
                }
            }

        }
}

struct CBackground_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}



struct WeatherOfTheWeekView: View {
    var weather: WeatherData
    
    var body: some View {
        VStack(spacing: 8) {
            Text(weather.dayOfTheWeek.uppercased())
                .font(.system(size: 20, weight: .semibold, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: weather.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text(weather.temperature)
                .font(.system(size: 20, weight: .semibold, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct CurrentWeatherView: View {
    
    var imageName: String
    var temperature: String
    
    var body: some View {
        VStack (spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            Text(temperature)
                .font(.system(size: 70, weight: .semibold, design: .default))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}

struct BackGroundColorView: View {
    
    @Binding var isNight : Bool
    
    var body: some View {
            LinearGradient(gradient: Gradient(
                colors: [
                    isNight ? .black : .blue,
                    isNight ? .gray :  Color("primary")
                ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        }
    
}
