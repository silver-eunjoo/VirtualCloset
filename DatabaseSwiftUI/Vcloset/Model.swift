//
//  Model.swift
//  Vcloset
//
//  Created by Hruthvik Raj on 2022/06/08.
//

import SwiftUI
import RealityKit
import Combine

enum ModelCategory: String, CaseIterable {
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


class Model: ObservableObject, Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var category: ModelCategory
    @Published var thumbnail: UIImage
    var modelEntity: ModelEntity?
    var scaleCompensation: Float
    
    private var cancellable: AnyCancellable?
    
    init (name: String, category: ModelCategory, scaleCompensation: Float = 0.1) {
        self.name = name
        self.category = category
        self.thumbnail = UIImage(systemName: "photo")!
        self.scaleCompensation = scaleCompensation
        
        FirebaseStorageHelper.asyncDownloadToFilesystem(relativePath: "thumbnails/\(self.name).jpeg") { localUrl in
            do {
                let imageData = try Data(contentsOf: localUrl)
                self.thumbnail = UIImage(data: imageData) ?? self.thumbnail
            } catch {
                print("error loading image: \(error.localizedDescription)")
            }
}
    }
    func asyncLoadModelEntity() {
       // let filename = self.name + ".usdz"
        FirebaseStorageHelper.asyncDownloadToFilesystem(relativePath: "models/\(self.name).usdz") { localUrl in
            self.cancellable = ModelEntity.loadModelAsync(contentsOf: localUrl)
                .sink(receiveCompletion: { loadCompletion in
                    
                    switch loadCompletion {
                    case .failure(let error): print("Unable to load modelEntity for \(self.name). Error: \(error.localizedDescription)")
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
}

//struct Models {
//    var all: [Model] = []
//
//    init() {
//        //Summer
//        let Kimono = Model(name: "Kimono", category: .Summer, scaleCompensation: 1.17)
//        let Summer_Shirt = Model(name: "Summer_Shirt", category: .Summer, scaleCompensation: 1.17)
//        //Winter
//        let Ddata = Model(name: "3Ddata", category: .Winter, scaleCompensation: 1.17)
//
//        //Autumn
//        let Japanese_Clothes = Model(name: "Japanese_Clothes", category: .Autumn, scaleCompensation: 1.15)
//        let Autumn_Pants = Model(name: "Autumn_Pants", category: .Autumn,  scaleCompensation: 1.17 )
//        //Spring
//        let Untitled_Scan = Model(name: "Untitled_Scan", category: .Spring, scaleCompensation: 1.17)
//        //let Adidas_Hoodie = Model(name: "Adidas_Hoodie", category: .Spring, scaleCompensation: 1.17)
//        let Spring_Pants = Model(name: "Spring_Pants", category: .Spring, scaleCompensation: 1.17)
//        self.all += [Kimono, Ddata, Japanese_Clothes, Untitled_Scan, Summer_Shirt, Autumn_Pants, Spring_Pants]
//    }
//
//    func get(category: ModelCategory) -> [Model] {
//        return all.filter( {$0.category == category} )
//    }
//}
