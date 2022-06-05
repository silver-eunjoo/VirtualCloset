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
    var springs = [Image("Clothes"),Image("cardigan2"),Image("Clothes"),Image("cardigan2"),Image("Clothes"),Image("cardigan2"),Image("Clothes"),Image("cardigan2")]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum:170))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(0..<8) { index in
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
    var summers = [Image("shirt"),Image("shorts"),Image("shirt"),Image("shorts"),Image("shirt"),Image("shorts"),Image("shorts"),Image("shirt")]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum:170))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(0..<8) { index in
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
    var falls = [Image("coat1"),Image("coat2"),Image("coat1"),Image("coat2"),Image("coat1"),Image("coat2"),Image("coat1"),Image("coat2")]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum:170))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(0..<8) { index in
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
    var winters = [Image("jacket"),Image("jacket2"),Image("jacket"),Image("jacket2"),Image("jacket"),Image("jacket2"),Image("jacket"),Image("jacket2")]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum:170))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(0..<8) { index in
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
