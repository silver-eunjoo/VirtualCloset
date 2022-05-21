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
                }.navigationTitle("Closet")
                Spacer().frame(height:50)
                NavigationLink(destination: SummerClothes()) {
                    Image(systemName: "sun.max.fill")
                        .font(.title)
                    Text("Summer Clothes")
                        .font(.title)
                }.navigationTitle("Closet")
                Spacer().frame(height:50)
                NavigationLink(destination: FallClothes()) {
                    Image(systemName: "wind")
                        .font(.title)
                    Text("Fall Clothes")
                        .font(.title)
                }.navigationTitle("Closet")
                Spacer().frame(height:50)
                NavigationLink(destination: WinterClothes()) {
                    Image(systemName: "snowflake")
                        .font(.title)
                    Text("Winter Clothes")
                        .font(.title)
                }.navigationTitle("Closet")
                Spacer().frame(height:50)
            }
            
        }
    }
}

struct SpringClothes: View {
    var body: some View {
        HStack{
            Image("Cardigan1")
                .resizable()
            Image("Nike")
                .resizable()
        }
    }
}

struct SummerClothes: View {
    var body: some View {
        HStack{
            Image("Tshirts")
                .resizable()
            Image("Shorts")
                .resizable()
        }
    }
}

struct FallClothes: View {
    var body: some View {
        HStack{
            Image("Coat")
                .resizable()
            Image("Coat1")
                .resizable()
        }
    }
}

struct WinterClothes: View {
    var body: some View {
        Image("Jacket")
            .resizable()
    }
}
