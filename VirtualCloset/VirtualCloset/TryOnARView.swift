//
//  TryOnARView.swift
//  VirtualCloset
//
//  Created by 이은주 on 2022/06/09.
//

import RealityKit
import ARKit
import FocusEntity

class TryOnARView: ARView {
    
    var focusEntity: FocusEntity?
    var modelDeletionManager: ModelDeletionManager
    
    required init(frame frameReact: CGRect, modelDeletionManager: ModelDeletionManager) {
        self.modelDeletionManager = modelDeletionManager
        super.init(frame: frameReact)
        
        focusEntity = FocusEntity(on: self, focus: .classic)
    
        self.configure()
        
        self.enableObjectDeletion()
    }
    
    @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been impelemtented")
    }
    
    @MainActor override required dynamic init(frame frameRect: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }
    

private func configure() {
    let config = ARBodyTrackingConfiguration()
    //session.run(config)
    print("Hello 2!")
    session.run(config, options: [])
    
    //return arView
    
//    let config = ARWorldTrackingConfiguration()
//    config.planeDetection = [.horizontal, .vertical]
//    session.run(config)
//
     
}

}


//MARK: - Object deletion Moethod
extension TryOnARView {
    func enableObjectDeletion() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(recognizer:)))
        self.addGestureRecognizer(longPressGesture)
    }
    @objc func handleLongPress(recognizer: UILongPressGestureRecognizer) {
        let location = recognizer.location(in: self)
        print("long pressed.")
        if let entity = self.entity(at: location) as? ModelEntity {
            modelDeletionManager.entitySelectedForDeletion = entity
        }
    }
}
