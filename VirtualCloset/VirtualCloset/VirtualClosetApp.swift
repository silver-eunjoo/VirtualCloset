//
//  VirtualClosetApp.swift
//  VirtualCloset
//
//  Created by 이은주 on 2022/06/09.
//

import SwiftUI

@main
struct VirtualClosetApp: App {
    @StateObject var palacementSettings = PlacementSettings()
    @StateObject var modelDeletionManager = ModelDeletionManager()
    var body: some Scene {
        WindowGroup{
            ContentView()
                .environmentObject(palacementSettings)
                .environmentObject(modelDeletionManager)
        }
    }
}
