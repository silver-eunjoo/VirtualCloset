//
//  ContentView.swift
//  VirtualCloset
//
//  Created by 이은주 on 2022/05/21.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        
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
            
            ContentViewtryon()
                .tabItem {
                    Image(systemName: "skew")
                    Text("Try On")
                }
            ContentViewhelp()
                .tabItem {
                    Image(systemName: "questionmark.fill")
                    Text("Help")
                }
        }
    }
}
//
//#if DEBUG
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//#endif
