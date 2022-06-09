//
//  TryOnARView.swift
//  Vcloset
//
//  Created by Hruthvik Raj on 2022/06/08.
//

import RealityKit
import ARKit
import FocusEntity
import SwiftUI
import Combine

class TryOnARView: ARView {
    
    var focusEntity: FocusEntity?
    var modelDeletionManager: ModelDeletionManager
    
    private var peopleOcclusionCancellable: AnyCancellable?
    private var objectOcclusionCancellable: AnyCancellable?
    private var lidarDebugCancellable: AnyCancellable?
    private var multiuserCancellable: AnyCancellable?
    
    
    required init(frame frameRect: CGRect, modelDeletionManager: ModelDeletionManager) {
        self.modelDeletionManager = modelDeletionManager
        super.init(frame: frameRect)
        
        focusEntity = FocusEntity(on: self, focus: .classic)
    
        self.configure()
//        self.initializeSettings()
//        self.setupSubscribers()
        self.enableObjectDeletion()
    }
    
//    required init(frame frameReact: CGRect, modelDeletionManager: ModelDeletionManager) {
//        fatalError("init(frame:) has not been implemented ")
//    }
    
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
/*
    
    private func initializeSettings() {
        self.updatePeopleOcclusion(isEnabled: sessionSettings.isPeopleOcclusionEnabled)
        self.updateObjectOcclusion(isEnabled: sessionSettings.isObjectOcclusionEnabled)
        self.updateLidarDebug(isEnabled: sessionSettings.isLidarDebugEnabled)
        self.updatemultiuser(isEnabled: sessionSettings.isMultiuserEnabled)
    }
    private func setupSubscribers() {
        self.peopleOcclusionCancellable = sessionSettings.$isPeopleOcclusionEnabled.sink { [weak self]
            isEnabled in
            self?.updatePeopleOcclusion(isEnabled: isEnabled)
        }
        self.objectOcclusionCancellable = sessionSettings.$isObjectOcclusionEnabled.sink { [weak self]
            isEnabled in
            self?.updateObjectOcclusion(isEnabled: isEnabled)
        }
        self.lidarDebugCancellable = sessionSettings.$isLidarDebugEnabled.sink { [weak self]
            isEnabled in
            self?.updateLidarDebug(isEnabled: isEnabled)
        }
        self.multiuserCancellable = sessionSettings.$isMultiuserEnabled.sink { [weak self]
            isEnabled in
            self?.updatemultiuser(isEnabled: isEnabled)
        }
    }
    
    private func updatePeopleOcclusion(isEnabled: Bool) {
        print("\(#file): isPeopleOcclusionEnabled is now \(isEnabled)")
        
        guard ARBodyTrackingConfiguration.supportsFrameSemantics(.personSegmentationWithDepth) else {
            return
        }
        guard let configuration = self.session.configuration as? ARBodyTrackingConfiguration else {
            return
        }
        
        if configuration.frameSemantics.contains(.personSegmentationWithDepth) {
            configuration.frameSemantics.remove(.personSegmentationWithDepth)
        } else {
            configuration.frameSemantics.insert(.personSegmentationWithDepth)
        }
        self.session.run(configuration)
    }
    private func updateObjectOcclusion(isEnabled: Bool) {
        print("\(#file): isObjectOcclusionEnabled is now \(isEnabled)")
        
        if self.environment.sceneUnderstanding.options.contains(.occlusion) {
            self.environment.sceneUnderstanding.options.remove(.occlusion)
        } else {
            self.environment.sceneUnderstanding.options.insert(.occlusion)
        }
    }
    private func updateLidarDebug(isEnabled: Bool) {
        print("\(#file): isLidarDebugEnabled is now \(isEnabled)")
        
        if self.debugOptions.contains(.showSceneUnderstanding) {
            self.debugOptions.remove(.showSceneUnderstanding)
        } else {
            self.debugOptions.insert(.showSceneUnderstanding)
        }
    }
    private func updatemultiuser(isEnabled: Bool) {
        print("\(#file): ismultiuserEnabled is now \(isEnabled)")
    }
}
*/

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


