//
//  Model.swift
//  ARWardrobe
//
//  Created by Arijit Pal on 2022/06/05.
//

import RealityKit
import UIKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity:  ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String){
        self.modelName = modelName
        
        self.image = UIImage(named: modelName)!
        
        let filename = modelName + ".usdz"
        
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: {loadCompleton in
                //Handle our error
                print("DEBUG: Unable to load modelEntity for modelName: \(self.modelName)")
            }, receiveValue: { modelEntity in
                //Get Our ModelEntity
                self.modelEntity = modelEntity
                print("DEBUG: Successfully loaded modelEntity for modelName: \(self.modelName)")
            })
          
    }
}
