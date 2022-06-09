//
//  ModelsViewModel.swift
//  Vcloset
//
//  Created by Hruthvik Raj on 2022/06/09.
//

import Foundation
import FirebaseFirestore

class ModelsViewModel: ObservableObject {
    @Published var models: [Model] = []
    
    private let db = Firestore.firestore()
    
    func fetchData() {
        db.collection("models").addSnapshotListener { (QuerySnapshot, error) in
            guard let documents = QuerySnapshot?.documents else {
                print("Firestore: No documents")
                return
            }
            
            self.models = documents.map { (queryDocumentSnapshot) -> Model in
                let data = queryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? ""
                let categoryText = data["category"] as? String ?? ""
                let category = ModelCategory(rawValue: categoryText) ?? .Summer
                let scaleCompensation = data["scaleCompensation"] as? Double ?? 1.0
                
                return Model(name: name, category: category, scaleCompensation: Float(scaleCompensation))
            }
        }
    }
}
