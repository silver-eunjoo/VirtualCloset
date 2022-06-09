//
//  Model.swift
//  Vcloset
//
//  Created by Hruthvik Raj on 2022/06/08.
//

import SwiftUI
import RealityKit
import Combine

enum ModelCategory: CaseIterable {
    case Summer
    case Winter
    case Spring
    case Autumn
    
    var label: String {
        get {
            switch self {
            case .Summer:
                return "Summer"
            case .Winter:
                return "Winter"
            case .Spring:
                return "Spring"
            case .Autumn:
                return "Autumn"
            }
        }
    }
}


class Model {
    var name: String
    var category: ModelCategory
    var thumbnail: UIImage
    var modelEntity: ModelEntity?
    var scaleCompensation: Float
    
    private var cancellable: AnyCancellable?
    
    init (name: String, category: ModelCategory, scaleCompensation: Float = 0.1) {
        self.name = name
        self.category = category
        self.thumbnail = UIImage(named: name) ?? UIImage(systemName: "photo")!
        self.scaleCompensation = scaleCompensation
}
    func asyncLoadModelEntity() {
        let filename = self.name + ".usdz"
        
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                
                switch loadCompletion {
                case .failure(let error): print("Unable to load modelEntity for \(filename). Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
                
            }, receiveValue: { modelEntity in
                
                self.modelEntity = modelEntity
                self.modelEntity?.scale *= self.scaleCompensation
                
                print("modelEntity for \(self.name) has been loaded.")
            })
    }
}

struct Models {
    var all: [Model] = []
    
    init() {
        //Summer
        let Kimono = Model(name: "Kimono", category: .Summer, scaleCompensation: 1.17)
        
        //Winter
        let Ddata = Model(name: "3Ddata", category: .Winter, scaleCompensation: 1.17)
        
        //Autumn
        let Japanese_Clothes = Model(name: "Japanese_Clothes", category: .Autumn, scaleCompensation: 1.17)
        
        //Spring
        let Untitled_Scan = Model(name: "Untitled_Scan", category: .Spring, scaleCompensation: 1.17)
        
        self.all += [Kimono, Ddata, Japanese_Clothes, Untitled_Scan]
    }
    
    func get(category: ModelCategory) -> [Model] {
        return all.filter( {$0.category == category} )
    }
}
