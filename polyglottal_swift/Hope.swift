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
                VStack {
                    Text("NeeTender")
                        .font(.title)
                    .padding(5)
                    NavigationLink(destination: LandmarkList()){
                        Text("Standard")
                        
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
                
                
            }
            
        
    }
}

struct Hope_Previews: PreviewProvider {
    static var previews: some View {
        Hope()
    }
}
