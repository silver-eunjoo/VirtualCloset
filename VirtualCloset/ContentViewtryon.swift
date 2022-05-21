//
//  ContentViewtryon.swift
//  VirtualCloset
//
//  Created by 이은주 on 2022/05/21.
//

import SwiftUI
import RealityKit

struct ContentViewtryon : View {
    private var models: [String] = {
        let filemanager = FileManager.default
        
        guard let  path = Bundle.main.resourcePath, let files=try?
                filemanager.contentsOfDirectory(atPath: path) else {
            return[]
        }
        
        var availableModels: [String] = []
        for filename in files where
        filename.hasSuffix("usdz") {
            let modelName = filename.replacingOccurrences(of: ".usdz", with: "")
            availableModels.append(modelName)
        }
        return availableModels
    }()
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer()
            
            ModelPickerView(models: self.models)
            PlacementButtonsView()
            
        }
        
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}
struct ModelPickerView: View {
    var models: [String]
    
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(0 ..< self.models.count) {
                    index in
                    Button(action: {
                        print("DEBUG: selected model with name: \(self.models[index])")
                    }) {
                        Image(uiImage: UIImage(named: self.models[index])!)
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1/1, contentMode: .fit)
                            .background(Color.white)
                            .cornerRadius(12)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(20)
        .background(Color.black.opacity(0.5))
    }
}

struct PlacementButtonsView: View {
    var body: some View {
        HStack{
            Button(action: {print("DEBUG: Cancel model placement.")
                
            }) {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white
                        .opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
            Button(action: {print("DEBUG: Confirm model placement.")
                
            }) {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white
                        .opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
        }
    }
}

