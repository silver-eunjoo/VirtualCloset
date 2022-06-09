//
//  AppView.swift
//  Vcloset
//
//  Created by Hruthvik Raj on 2022/06/09.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        VStack{
        TabView{
            ContentViewHome()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Home")
                }
            
            ContentViewCloset()
                .tabItem {
                    Image(systemName: "tray.fill")
                    Text("Closet")
                }
            
//
            ContentView()
                .tabItem {
                    Image(systemName: "skew")
                    Text("Try On")
                }
        //.background(Color.white.opacity(0.15))
            GuideView()
                .tabItem {
                    Image(systemName:
                            "questionmark")
                    Text("Guide")
                          
                }
        }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environmentObject(PlacementSettings())
            .environmentObject(ModelDeletionManager())
           // .environmentObject(SessionSettings())
    }
}
#endif

