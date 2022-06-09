//
//  PlacementSettings.swift
//  Vcloset
//
//  Created by Hruthvik Raj on 2022/06/08.
//

import SwiftUI
import RealityKit
import Combine


class PlacementSettings: ObservableObject{
// When the user selects a model in BrowseView, this property is set.

    @Published var selectedModel: Model? {
        willSet(newValue){
            print("Setting selectedModel to \(String (describing: newValue?.name))")
        }
    }

    // When the user taps confirm in PlacementView, the value of selectedMo

    @Published var confirmedModel: Model? {
        willSet(newValue){
            guard let model = newValue else {
                print("Clearing confirmedModel")
                return
            }
            print("Setting confirmedModel to \(model.name)")
            
            self.recentlyPlaced.append(model)
        }
    }
    
    @Published var recentlyPlaced: [Model] = []
    // this property retains the cancelable object for our SceneEvents.update subscriber
    var sceneObserver: Cancellable?
}
