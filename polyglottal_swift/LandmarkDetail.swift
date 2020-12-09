//
//  LandmarkDetail.swift
//  polyglottal_swift
//
//  Created by HONGHYONGGUK on 2020/10/01.
//  Copyright © 2020 HONGHYONGGUK. All rights reserved.
//
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .leading, endPoint: .trailing))
            .clipShape(Circle())
            .shadow(radius: 7)
        .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
            //.cornerRadius(15.0)
    }
}
struct GradientButtonStyle2: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .clipShape(Circle())
            .shadow(radius: 7)
        .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
            //.cornerRadius(15.0)
    }
}

struct LandmarkDetail: View {
    var landmark: Landmark

    var body: some View {
         ScrollView{
            VStack {
                MapView(coordinate: landmark.locationCoordinate)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 250)

                CircleImage(image: landmark.image)
                    .offset(x: 0, y: -170)
                    .padding(.bottom, -190)

                VStack {
                    Text(landmark.name)
                        .font(.title)

                    HStack(alignment: .top) {
                        Text("Rppongi")
                            .font(.subheadline)
                        
                        Text("Tokyo")
                            .font(.subheadline)
                    }
                }
                .padding(.top, 40)
                HStack{
                    Button(action: {
                        print("Pushed Like!")
                                   }){
                        HStack{
                           Image(systemName: "multiply")
                               .font(.largeTitle)
                            .frame(width: 50, height: 50)
                       }
                    }.buttonStyle(GradientButtonStyle2())
                        .padding(20)
                    Button(action: {
                        print("Pushed Like!")
                    }){
                        HStack{
                            Image(systemName: "heart")
                                .font(.largeTitle)
                            .frame(width: 50, height: 50)
                            
                            
                        }
                    }.buttonStyle(GradientButtonStyle( ))
                    .padding(20)
                }
                .padding(.bottom, 80)
                Spacer()
            }
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
    }
}

