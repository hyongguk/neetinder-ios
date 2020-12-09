//
//  SelectType.swift
//  Landmarks
//
//  Created by HONGHYONGGUK on 2020/10/01.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI


struct SelectType: View {
    //var image: Image
    //var persons = ["Beyonce"]
    @State private var selectedPersonIndex = 0
    @State private var showTop3 = false
    var celebrities = ["Beyonce", "KeikoKitagawa", "Selena Gomez", "Emma Watson", "Alexandra Daddario", "Aishwarya Rai Bachchan", "Deepika Padukone", "Priyanka Chopra", "Fan Bingbing", "Candice Swanepoel", "Taylor Swift"]
    
    @State private var selectedFrameworkIndex = 0
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.orange]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("あなたの好きなタイプを教えてください")
                    .foregroundColor(.white)
                    .bold()
                    .shadow(radius: 20)
                
              Picker(selection: $selectedFrameworkIndex, label: Text("")) {
                  ForEach(0 ..< celebrities.count) {
                     Text(self.celebrities[$0])
                        .bold()
                  }
                }.padding()
    //            Button(action: {
    //                self.showTop3.toggle()
    //            }) {
    //                Text("Seach")
    //                    .padding(5)
    //                    .overlay(
    //                        RoundedRectangle(cornerRadius: 5.0)
    //                            .stroke(lineWidth:2.0)
    //                )
    //            }.sheet(isPresented: $showTop3){
    //                Top3(celeb: self.celebrities[self.selectedFrameworkIndex])
    //            }
                NavigationLink(destination: Top3(celeb: self.celebrities[self.selectedFrameworkIndex])){
                    Text("Find")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 50.0, height: 50.0)
                    .overlay(RoundedRectangle(cornerRadius: 50)
                                .stroke(lineWidth: 3.0)
                    )
                        .foregroundColor(Color.white)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5)
                }
                .padding()
            
            }

        }
    }
}

struct SelectType_Previews: PreviewProvider {
    static var previews: some View {
        SelectType()
    }
}

