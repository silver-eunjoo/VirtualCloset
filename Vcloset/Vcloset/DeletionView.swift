//
//  DeletionView.swift
//  Vcloset
//
//  Created by Hruthvik Raj on 2022/06/09.
//

import SwiftUI

struct DeletionView: View {
    @EnvironmentObject var modelDeletionManager: ModelDeletionManager
    
    var body: some View {
        HStack {
            
            Spacer()
            DeletionButton(systemIconName: "xmark.circle.fill") {
                print("cancel Dletion button presed.")
                self.modelDeletionManager.entitySelectedForDeletion = nil
            }
            
            Spacer()
            
            DeletionButton(systemIconName: "trash.circle.fill") {
                print("Confired delete")
                
                guard let anchor = self.modelDeletionManager.entitySelectedForDeletion?.anchor else { return }
                
                let anchoringIdentifer = anchor.anchorIdentifier
                
                anchor.removeFromParent()
                self.modelDeletionManager.entitySelectedForDeletion = nil
            }
            
            Spacer()
        }
        .padding(.bottom, 30)
    }
}

struct DeletionButton: View {
    let systemIconName: String
    let action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(systemName: systemIconName)
                .font(.system(size: 50, weight: .light, design: .default))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 75, height: 75)
    }
}

