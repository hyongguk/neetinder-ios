//
//  Hope.swift
//  polyglottal_swift
//
//  Created by HONGHYONGGUK on 2020/10/02.
//  Copyright © 2020 HONGHYONGGUK. All rights reserved.
//

import SwiftUI

struct Hope: View {
    var body: some View {
        
            NavigationView{
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color.pink, Color.orange]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    VStack {
                        Text("NeeTinder")
                            .font(.system(size: 50, design: .default))
                            .bold()
                            .foregroundColor(.white)
                        .padding(-100)
                            
                        NavigationLink(destination: LandmarkList()){
                            Text("Standard")
                                .bold()
                            
    //                            Button(action: {
    //                                print("Button action")
    //                            }) {
    //                                Text("Standard")
    //                                    .padding(5)
    //                                    .overlay(
    //                                        RoundedRectangle(cornerRadius: 5.0)
    //                                            .stroke(lineWidth:2.0)
    //                                )
    //                            }
                        }
                        .padding()
                        NavigationLink(destination: SelectType()){
                            Text("Premium")
                                .bold()
    //                        Button(action: {
    //                            print("Button action")
    //                        }) {
    //                            Text("Premium")
    //                                .padding(5)
    //                                .overlay(
    //                                    RoundedRectangle(cornerRadius: 5.0)
    //                                        .stroke(lineWidth:2.0)
    //                            )
    //                        }
                            
                        }
                    }
                    .padding(.bottom)

                }
                
                
                
            }
            
        
    }
    
}

struct Hope_Previews: PreviewProvider {
    static var previews: some View {
        Hope()
    }
}
