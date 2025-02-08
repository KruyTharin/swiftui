//
//  Background.swift
//  swiftui
//
//  Created by Tharin KRUY on 8/2/25.
//

import SwiftUI

struct WeatherView: View{
    var body: some View{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, Color("primary")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Phnom Penh, CAM")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .frame(width: 300)
                
                VStack (spacing: 8){
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    
                    Text("76°")
                        .font(.system(size: 70, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                }.padding(.bottom, 40)
                
                HStack (spacing: 8){
                    WeatherOfTheWeekView(
                        imageName: "cloud.sun.fill",
                        dayOfTheWeek: "Mon",
                        temperature: "25°"
                    )
                    WeatherOfTheWeekView(
                        imageName: "cloud.sun.rain.fill",
                        dayOfTheWeek: "Tue",
                        temperature: "20°"
                    )
                    WeatherOfTheWeekView(
                        imageName: "cloud.sun.bolt.fill",
                        dayOfTheWeek: "Wen",
                        temperature: "19°"
                    )
                    WeatherOfTheWeekView(
                        imageName: "sun.max.fill",
                        dayOfTheWeek: "Thu",
                        temperature: "40°"
                    )
                    WeatherOfTheWeekView(
                        imageName: "cloud.sun.fill",
                        dayOfTheWeek: "Fri",
                        temperature: "25°"
                    )
                    WeatherOfTheWeekView(
                        imageName: "cloud.sun.fill",
                        dayOfTheWeek: "Sat",
                        temperature: "25°"
                    )
                }
            
                Spacer()
                
                Button {
                    print("Cliked")
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
    var imageName: String
    var dayOfTheWeek: String
    var temperature: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(dayOfTheWeek.uppercased())
                .font(.system(size: 20, weight: .semibold, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text(temperature)
                .font(.system(size: 20, weight: .semibold, design: .default))
                .foregroundColor(.white)
        }
    }
}
