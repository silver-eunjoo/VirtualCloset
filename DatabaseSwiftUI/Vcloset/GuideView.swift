//
//  GuideView.swift
//  Vcloset
//
//  Created by Hruthvik Raj on 2022/06/01.
//


import SwiftUI

struct GuideView: View {
    var body: some View {
        VStack{
            helpandguide()
           
        }
        //.background(LinearGradient(gradient: Gradient(colors: [.white, .gray ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        
    }
    
    struct helpandguide: View {
        var body: some View {
            Text("Help & Guide")
                .font(.largeTitle)
//                .foregroundColor(Color.blue)
                .bold()
                .padding(.all, 120.0)
                .padding(.all, -120.0)
                .multilineTextAlignment(.center)

            Text("1)Click on Closet to view all your clothes in their respective categories ")
                .padding([.top, .leading])

            Text("2)Go to Try On and choose the clothes you want to try on in AR")
                .padding([.top, .leading])

            Text("3)To add more clothes to the app, contact the developers at: https://github.com/silver-eunjoo/VirtualCloset")
                .padding([.top, .leading])

    
        }
    }
    
}
    


