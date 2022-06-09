//
//  BrowseView.swift
//  Vcloset
//
//  Created by Hruthvik Raj on 2022/06/08.
//

import SwiftUI

struct BrowseView: View {
    @Binding var showBrowse: Bool
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false) {
                RecentsGrid(showBrowse: $showBrowse)
                ModelsByCategorygrid(showBrowse: $showBrowse)
            }
            .navigationBarTitle(Text("Browse"), displayMode: .large)
            .navigationBarItems(trailing: Button(action: {
                self.showBrowse.toggle()
            }) {
                Text("Done").bold()
            })
        }
    }
}

struct RecentsGrid: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    @Binding var showBrowse: Bool
    
    var body: some View {
        if !self.placementSettings.recentlyPlaced.isEmpty {
            HorizontalGrid(showBrowse: $showBrowse, title: "Recents", items: getRecentsUniqueOrdered())
        }
    }
    
    func getRecentsUniqueOrdered() -> [Model] {
        var recentsUniqueOrderedArray: [Model] = []
        var modelNameSet: Set<String> = []
        
        for model in self.placementSettings.recentlyPlaced.reversed() {
            
            if !modelNameSet.contains(model.name) {
                recentsUniqueOrderedArray.append(model)
                modelNameSet.insert(model.name)
            }
        }
        
        return recentsUniqueOrderedArray
    }
}

struct ModelsByCategorygrid: View {
    @Binding var showBrowse: Bool
    let models = Models()
    
    var body: some View {
        VStack {
            ForEach(ModelCategory.allCases, id: \.self) { category in
                
                if let modelsByCategory = models.get(category: category) {
                    HorizontalGrid(showBrowse: $showBrowse, title: category.label, items: modelsByCategory)
                }
            }
        }
    }
}


struct HorizontalGrid: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    @Binding var showBrowse: Bool
    var title: String
    var items: [Model]
    private let gridItemLayout = [GridItem(.fixed (150)) ]

    var body: some View {

        VStack(alignment: .leading) {

            Text (title)
                .font(.title2) .bold()
                .padding(.leading, 22)
                .padding (.top, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid (rows: gridItemLayout, spacing: 30) {
                    ForEach(0..<items.count) { index in
                        
                        let model = items[index]
                        
                        ItemButton(model: model) {
                            model.asyncLoadModelEntity()
                            self.placementSettings.selectedModel = model 
                            print("BrowseView: selected\(model.name)")
                            self.showBrowse = false
                        }
                    }
                }
                    .padding (.horizontal, 22)
                    .padding (.vertical, 10)
                }
        }
    }
}

struct ItemButton: View {
    let model: Model
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(uiImage: self.model.thumbnail)
                .resizable()
                .frame(height: 150)
                .aspectRatio(1/1, contentMode: .fit)
                .background(Color(UIColor.secondarySystemFill))
                .cornerRadius(8.0)
        }
    }
}

struct Separator: View {
    var body: some View {
        Divider()
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
    }
}
                


