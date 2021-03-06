//
//  Top3.swift
//  polyglottal_swift
//
//  Created by HONGHYONGGUK on 2020/10/02.
//  Copyright © 2020 HONGHYONGGUK. All rights reserved.
//

import SwiftUI
import UIKit
var num1:String!
var num2:String!
var num3:String!
struct Response: Codable {
    var first: Info
    var second: Info
    var third: Info
    
    struct Info: Codable {
        var name: String!
        var image: String!
    }
}

//struct Result: Codable {
//    var id = UUID()
//    var first: String
//    var second: String
//    var third: String
//}
struct Top3: View {
    var celeb: String
    //@State var result: String = "wait a second"
    @State var isLoading: Bool = true
    @State var resultImage: Image? = nil
    @State var resultImage2: Image? = nil
    @State var resultImage3: Image? = nil
    @State var resultname1: String = ""
    @State var resultname2: String = ""
    @State var resultname3: String = ""

    //@State private var results = [Result]()

    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.orange]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                VStack(spacing: 40){
                    if isLoading{
                        
                        Image(self.celeb)
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            .scaledToFill()
                            .frame(width: 300)
                            .padding(50)
                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                            .padding(-80)
                        Text("Loding...")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
    //                        .transition(.slide)
    //                        .animation(.default)
                    }
                    resultImage
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .frame(width: 300)
                        .padding(.bottom, -20)
                        .shadow(color: .white, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    
                    Text(resultname1)
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                    
                    Spacer()
                    resultImage2
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .padding(.bottom, -20)
                        .shadow(color:.white, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    Text(resultname2)
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                    Spacer()
                    resultImage3
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .padding(.bottom, -20)
                        .shadow(color: .white, radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    Text(resultname3)
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                }
                .onAppear{
                   // self.deleteImage()
                    self.loadData()
                }
            }

        }
        
        
//        List(results, id: \.id) { item in
//            VStack(alignment: .leading) {
//                Text(item.first)
//                    .font(.headline)
//
//            }
//        }
//    .onAppear(perform: loadData)
    }
    func loadData() {
        if let url = URL(string: "http://localhost:9000/?name=\(self.celeb)") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                //dataは来た
                 if let jsonString = String(data: data, encoding: .utf8) {
                    print(jsonString)
                 }
                    do {
                        let res = try JSONDecoder().decode(Response.self, from: data)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        print("これがーーーーーー")
                        print(res)
                            self.resultImage = Image(res.first.image)
                            self.resultImage2 = Image(res.second.image)
                            self.resultImage3 = Image(res.third.image)
                            self.resultname1 = res.first.name
                            self.resultname2 = res.second.name
                            self.resultname3 = res.third.name
                            self.isLoading = false
                        }
                        
                        
                        
                    } catch let error {
                       print(error) 
                    }
               }
           }.resume()
        }
    }
    
    func deleteImage(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            withAnimation(.easeIn(duration:2)){
                self.isLoading = false
            }
        }
    }
    
    
}

struct Top3_Previews: PreviewProvider {
    static var previews: some View {
        Top3(celeb: "Beyonce")
    }
}
