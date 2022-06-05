//
//  ContentView.swift
//  ARWardrobe
//
//  Created by Arijit Pal on 2022/05/14.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    
    @State private var isPlacementEnabled = false
    @State private var selectedModel: Model?
    @State private var modelConfirmedForPlacement: Model?
    
    private var models: [Model] =/* ["fender_stratcaster","teapot","toy_biplane", "toy_car","tv_retro"]*/ {
        //Dynamically getting our model filenames
        let filemanager = FileManager.default
        
        guard let path = Bundle.main.resourcePath, let files = try? filemanager.contentsOfDirectory(atPath: path) else{
            return []
        }
        
        var availableModels: [Model] = []
        
        for filename in files where filename.hasSuffix("uszd"){
            let modelName = filename.replacingOccurrences(of: ".usdz", with: "")
            
            let model = Model(modelName: modelName)
            availableModels.append(model)
        }
        return availableModels
    }()
    
    var body: some View {
        ZStack (alignment: .bottom) {
            ARViewContainer(modelConfirmedForPlacement: $modelConfirmedForPlacement)
            
            if self.isPlacementEnabled {
                PlacementButtonView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
            } else {
                ModelPickerView(isPlaementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, models: self.models)
                
            }
            
            //ModelPickerView(models: self.models)
            //PlacementButtonView()
            
            
            
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    @Binding var modelConfirmedForPlacement: Model?
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
            config.sceneReconstruction = .mesh
        }
        
        arView.session.run(config)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let model = self.modelConfirmedForPlacement {
            if let modelEntity = model.modelEntity{
                print("DEBUG: Unable to load modelEntity for: \(model.modelName)")
                
                let anchorEntity = AnchorEntity(plane: .any)
                anchorEntity.addChild(modelEntity.clone(recursive: true))
                
                uiView.scene.addAnchor(anchorEntity)
            } else {
                print("DEBUG: Adding Model to scene - \(model.modelName)")
            }
            
            
            
            DispatchQueue.main.async {
                self.modelConfirmedForPlacement = nil
            }
            
        }
    }
    
}

struct ModelPickerView: View {
    @Binding var isPlaementEnabled: Bool
    @Binding var selectedModel: Model?
    
    
    var models: [Model]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 30){
                ForEach(0 ..< self.models.count) {
                    index in Button(action: {
                        print("DEBUG: selected model with name: \(self.models[index].modelName)")
                        
                        self.selectedModel = self.models[index]
                        self.isPlaementEnabled = true
                    })
                    {
                        Image(uiImage: self.models[index].image)
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1/1,contentMode: .fit)
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

struct PlacementButtonView: View {
    
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    @Binding var modelConfirmedForPlacement: Model?
    
    var body: some View {
        HStack {
            //cancel Button
            Button(action: { print("DEBUG: Model Placement Cancelled")
                self.resetPlacementParameters()
            })
            {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
            
            //Confirm Button
            Button(action: { print("DEBUG: Model Placement Confirmed")
                self.modelConfirmedForPlacement = self.selectedModel
                self.resetPlacementParameters()
            })
            {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
        }
    }
    
    func resetPlacementParameters() {
        self.isPlacementEnabled = false
        self.selectedModel = nil
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
