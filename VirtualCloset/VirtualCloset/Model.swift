//
//  Model.swift
//  Vlet
//
//  Created by Hruthvik Raj on 2022/05/28.
//

import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?

    private var cancellable: AnyCancellable? = nil
    init(modelName: String)
    {
        self.modelName = modelName

        self.image = UIImage(named: modelName)!

        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                print("DEBUG: Unable to load modelEntity for modelName: \(self.modelName)")
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                print("DEBUG: Succesfully loaded modelEntity for modelName: \(self.modelName)")
            })
    }
}

