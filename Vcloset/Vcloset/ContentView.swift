//
//  ContentView.swift
//  Vcloset
//
//  Created by Hruthvik Raj on 2022/05/28.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    @EnvironmentObject var placementSettings: PlacementSettings
    @EnvironmentObject var modelDeletionManager: ModelDeletionManager
    
    @State private var isControlVisible: Bool = true
    @State private var showBrowse: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer()
            
            
            if self.placementSettings.selectedModel != nil {
                PlacementView()
            } else if self.modelDeletionManager.entitySelectedForDeletion != nil {
                DeletionView()
            } else {
                ControlView(isControlVisible: $isControlVisible, showBrowse: $showBrowse)
            }
//            if self.placementSettings.selectedModel == nil {
//            ControlView(isControlVisible: $isControlVisible, showBrowse: $showBrowse)
//        } else {
//            PlacementView()
//        }
        }
        //.edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var placementSettings: PlacementSettings
    @EnvironmentObject var modelDeletionManager: ModelDeletionManager
   
    func makeUIView(context: Context) -> TryOnARView {
        
        let arView = TryOnARView(frame: .zero, modelDeletionManager: modelDeletionManager)
        
        self.placementSettings.sceneObserver = arView.scene.subscribe(to: SceneEvents.Update.self, { (event) in
            
            self.updateScene(for: arView)
            
        })
        
        return arView
        
    } /*
    func makeUIView(context: Context) -> ARView {

            let arView = ARView(frame: .zero)

            let config = ARBodyTrackingConfiguration()
            arView.session.run(config, options: [])
            
            return arView

        }*/
    
    func updateUIView(_ uiView: TryOnARView, context: Context) {
        /*if let model = self.placementSettings.confirmedModel {

                    if let modelEntity = model.modelEntity{
                        print("DEBUG: adding model to scene -\(model.name)")
                        let anchor = AnchorEntity(.body)
                        modelEntity.position = simd_make_float3(0, 0.15, 0)
                        anchor.addChild(modelEntity/*.clone(recursive: true)*/)

                        uiView.scene.anchors.append(anchor) } else {
                            print("DEBUG: Unable to load modelEntity for  -\(model.name)")
                        }

                    DispatchQueue.main.async {
                        self.placementSettings.confirmedModel = nil
                    }
                }*/
    }
    
    private func updateScene(for arView: TryOnARView) {
        
        // Display logic
        arView.focusEntity?.isEnabled = self.placementSettings.selectedModel != nil
        
        if let confirmedModel = self.placementSettings.confirmedModel, let modelEntity = confirmedModel.modelEntity {
            print("hello")
            self.place(modelEntity, in: arView)
            print("hello 3")
            self.placementSettings.confirmedModel = nil
        }
        
    }
    
    private func place(_ modelEntity: ModelEntity, in arView: ARView) {
        
        let clonedEntity = modelEntity.clone(recursive: true)
        clonedEntity.generateCollisionShapes(recursive: true)
        //arView.installGestures([.translation, .rotation], for: clonedEntity)
        //let anchor = AnchorEntity(plane: .any)
        let anchor = AnchorEntity(.body)
        clonedEntity.position = simd_make_float3(0, 0.15, 0)
        anchor.addChild(clonedEntity)
        //anchor.scene?.addAnchor(anchor)
        arView.scene.anchors.append(anchor)
        print("Added model to Scene")
    }
    
}
/*
//#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PlacementSettings())
    }
}
//#endif
 */
