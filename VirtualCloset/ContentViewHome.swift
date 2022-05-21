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
                .padding(.trailing, 120.0)
                .padding(.top, -120.0)
                .multilineTextAlignment(.leading)
                
            Image("User")
                .cornerRadius(200)
            
            Text("은주님 환영합니다!")
                .font(.title)
                .padding(.top, 50)
        }
        
    }
    
    
}
