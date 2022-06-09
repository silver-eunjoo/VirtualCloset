//
//  VCloset.swift
//  Vcloset
//
//  Created by Hruthvik Raj on 2022/06/08.
//

import SwiftUI
import Firebase

@main
struct VCloset: App {
    @StateObject var palacementSettings = PlacementSettings()
   // @StateObject var sessionSettings = SessionSettings()
    @StateObject var modelDeletionManager = ModelDeletionManager()
    
    init() {
        FirebaseApp.configure()
        
        //Anonymous AUthentication
        Auth.auth().signInAnonymously() { authResult, error in
            guard let user = authResult?.user else {
                print("Failed: Anonymous Authentication with Firebase.")
                return
            }
            let uid = user.uid
            print("Firebase: Anonymous user authentication with uid: \(uid).")
        }
    }
    var body: some Scene {
        WindowGroup{
            AppView()
                .environmentObject(palacementSettings)
                .environmentObject(modelDeletionManager)
               // .environmentObject(sessionSettings)
        }
    }
}
 
