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
    var celebrities = ["Beyonce", "KeikoKitagawa", ""]
    
    @State private var selectedFrameworkIndex = 0
    var body: some View {
        VStack {
            Text("Who is your favorite celebrity?")
          Picker(selection: $selectedFrameworkIndex, label: Text("")) {
              ForEach(0 ..< celebrities.count) {
                 Text(self.celebrities[$0])
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
                .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 10.0)
                        .stroke(lineWidth: 3.0)
                )
            }
            .padding()
        
        }
    }
}

struct SelectType_Previews: PreviewProvider {
    static var previews: some View {
        SelectType()
    }
}

