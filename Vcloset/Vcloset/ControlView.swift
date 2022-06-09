//
//  ControlView.swift
//  Vcloset
//
//  Created by Hruthvik Raj on 2022/05/28.
//

import SwiftUI

struct ControlView: View {
    @Binding var isControlVisible: Bool
    @Binding var showBrowse: Bool
    
    var body: some View {
        
        VStack {
            CVToggleButton(isControlVisible: $isControlVisible)
            
            Spacer(minLength: 50)
            
            if isControlVisible {
                ControlButtonBar(showBrowse: $showBrowse)
            }
        
        }
        
    }
}


struct CVToggleButton: View {
    @Binding var isControlVisible: Bool
    
    var body: some View {
        HStack {
            
            Spacer()
            
            ZStack {
                
                Color.black.opacity(0.25)
                
                Button(action: {
                    print("Control visibility Toggle Button pressed.")
                    self.isControlVisible.toggle()
                }) {
                    Image(systemName: self.isControlVisible ? "rectangle" : "slider.horizontal.below.rectangle")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8.0)
        }
        .padding(.top, 45)
        .padding(.trailing, 20)
    }
}

struct ControlButtonBar: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    @Binding var showBrowse: Bool
    
    var body: some View {
        HStack {
            
            MostRecentlyPlacedButton().hidden(self.placementSettings.recentlyPlaced.isEmpty)
            
            Spacer()
            
            Controlbutton(systemIconName: "square.grid.2x2") {
                print("browse button pressed.");
                self.showBrowse.toggle()
            }.sheet(isPresented: $showBrowse, content: {
                BrowseView(showBrowse: $showBrowse)
            })
            
            //Spacer()
            
//            Controlbutton(systemIconName: "slider.horizontal.3") {
//                print("settings button pressed.");
//            }
        }
        .frame(maxWidth: 500)
        .padding(30)
        .background(Color.white.opacity(0.25))
    }
}


struct Controlbutton: View {
    let systemIconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(systemName: systemIconName)
                .font(.system(size:35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 50, height: 50)
    }
}

struct MostRecentlyPlacedButton: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    
    var body: some View {
        Button(action: {
            print("Most Recently Placed button presed.")
            self.placementSettings.selectedModel = self.placementSettings.recentlyPlaced.last
        }) {
            if let mostRecentlyPlacedModel = self.placementSettings.recentlyPlaced.last {
                Image(uiImage: mostRecentlyPlacedModel.thumbnail)
                    .resizable()
                    .frame(width: 46)
                    .aspectRatio(1/1, contentMode: .fit)
            } else {
                Image(systemName: "clock.fill")
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                    .buttonStyle(PlainButtonStyle())
            }
        }
        .frame(width: 50, height: 50)
        .background(Color.white)
        .cornerRadius(8.0)
    }
}
