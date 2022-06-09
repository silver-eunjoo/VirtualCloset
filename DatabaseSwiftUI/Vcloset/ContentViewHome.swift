//
//  ContentViewHome.swift
//  VirtualCloset
//
//  Created by 이은주 on 2022/05/21.
//

import SwiftUI

struct ContentViewHome: View {
    var body: some View {
        VStack{
            Text("Welcome to your Virtual Closet!")
                .font(.largeTitle)
//                .foregroundColor(Color.blue)
                .bold()
                .padding(.all, 120.0)
                .padding(.all, -120.0)
                .multilineTextAlignment(.center)
                
            //Image("User")
            //    .cornerRadius(200)
            
            Text("안녕하세요!")
                .font(.title)
                .padding(.top, 50)
        }
        
    }
    
    
}
