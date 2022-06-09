//
//  ContentViewCloset.swift
//  VirtualCloset
//
//  Created by 이은주 on 2022/06/09.
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
    var springs = [Image("springpant"),Image("springshirt"), Image("Kimono")]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum:170))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(0..<3) { index in
                        springs[index]
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(10)
                            .shadow(color:Color.primary.opacity(0.3), radius:1)
                    }
                    
                }
            }
        }.navigationTitle("Your Spring Clothes")
    }
}

struct SummerClothes: View {
    var summers = [Image("summerpant"),Image("summershirt"),Image("summershirt2")]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum:170))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(0..<3) { index in
                        summers[index]
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(10)
                            .shadow(color:Color.primary.opacity(0.3), radius:1)
                    }
                    
                }
            }
        }.navigationTitle("Your Summer Clothes")
    }
}

struct FallClothes: View {
    var falls = [Image("autumnpant"),Image("autumnshirt"), Image("Untitled_Scan")]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum:170))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(0..<3) { index in
                        falls[index]
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(10)
                            .shadow(color:Color.primary.opacity(0.3), radius:1)
                    }
                    
                }
            }
        }.navigationTitle("Your Fall Clothes")
    }
}

struct WinterClothes: View {
    var winters = [Image("jacket2"),Image("winterpant")]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum:170))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(0..<2) { index in
                        winters[index]
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(10)
                            .shadow(color:Color.primary.opacity(0.3), radius:1)
                    }
                    
                }
            }
        }.navigationTitle("Your Winter Clothes")
    }
}
