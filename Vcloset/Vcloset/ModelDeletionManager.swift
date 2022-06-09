//
//  ModelDeletionManager.swift
//  Vlet
//
//  Created by Hruthvik Raj on 2022/06/05.
//

import SwiftUI
import RealityKit

class ModelDeletionManager: ObservableObject {
    @Published var entitySelectedForDeletion: ModelEntity? = nil {
    willSet(newValue) {

    if self.entitySelectedForDeletion == nil, let newlySelectedModelEntity = newValue {
    // Selecting new entitySelectedForDeletion, no prior selection
    print("Selecting new entitySelectedForDeletion, no prior selection. ")


        let component = ModelDebugOptionsComponent(visualizationMode: .lightingDiffuse)
    newlySelectedModelEntity.modelDebugOptions=component
    }
    else if let previouslySelectedModelEntity = self.entitySelectedForDeletion,
    let newlySelectedModelEntity = newValue {


    // Selecting new entitySelectedForDeletion, had a prior selection
    print("Selecting new entitySelectedForDeletion, had a prior selection.")


    // Un-highlight previouslySelectedModelEntity
        previouslySelectedModelEntity.modelDebugOptions = nil


    // Highlight newlySelectedModelEntity
    let component = ModelDebugOptionsComponent (visualizationMode: .lightingDiffuse)
    newlySelectedModelEntity.modelDebugOptions = component
    } else if newValue == nil {
        print("clearing clothSelectedforDeletion.")
        self.entitySelectedForDeletion?.modelDebugOptions = nil
    }
    }
}
}
