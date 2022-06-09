//
//  VCloset.swift
//  Vcloset
//
//  Created by Hruthvik Raj on 2022/06/08.
//

import SwiftUI

@main
struct VCloset: App {
    @StateObject var palacementSettings = PlacementSettings()
    @StateObject var modelDeletionManager = ModelDeletionManager()
    var body: some Scene {
        WindowGroup{
            AppView()
                .environmentObject(palacementSettings)
                .environmentObject(modelDeletionManager)
        }
    }
}
 
