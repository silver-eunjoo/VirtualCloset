//
//  ContentViewCloset.swift
//  VirtualCloset
//
//  Created by 이은주 on 2022/05/21.
//

import SwiftUI

struct ContentViewCloset: View {
    
    var body: some View {
        NavigationView() {
            VStack {
                NavigationLink(destination: SpringClothes()) {
                    Image(systemName: "leaf")
                        .font(.title)
                    Text("Spring Clothes")
                        .font(.title)
                }.navigationTitle("Clothes")
                Spacer().frame(height:50)
                NavigationLink(destination: SummerClothes()) {
                    Image(systemName: "sun.max.fill")
                        .font(.title)
                    Text("Summer Clothes")
                        .font(.title)
                }.navigationTitle("Clothes")
                Spacer().frame(height:50)
                NavigationLink(destination: SummerClothes()) {
                    Image(systemName: "wind")
                        .font(.title)
                    Text("Fall Clothes")
                        .font(.title)
                }.navigationTitle("Clothes")
                Spacer().frame(height:50)
                NavigationLink(destination: SummerClothes()) {
                    Image(systemName: "snowflake")
                        .font(.title)
                    Text("Winter Clothes")
                        .font(.title)
                }.navigationTitle("Clothes")
                Spacer().frame(height:50)
            }
            
        }
    }
}

struct SpringClothes: View {
    var body: some View {
        Text(verbatim: "ContentViewCar")
    }
}

struct SummerClothes: View {
    var body: some View {
        Text(verbatim: "ContentViewCar")
    }
}

struct FallClothes: View {
    var body: some View {
        Text(verbatim: "ContentViewCar")
    }
}

struct WinterClothes: View {
    var body: some View {
        Text(verbatim: "ContentViewCar")
    }
}
