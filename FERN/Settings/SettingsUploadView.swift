//
//  SettingsUploadView.swift
//  FERN
//
//  Created by Hopp, Dan on 1/16/24.
//

import SwiftUI
import SwiftData

struct SettingsUploadView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var settings: [Settings]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(settings) { item in
                    NavigationLink(item.uploadScriptURL){
                        EditUploadView(setting: item)
                    }
                }
            }
            .toolbar {
                Button("Add URL", action: addValue)
            }
        }
    }
    
    func addValue() {
        // Only add one
        if settings.count < 1 {
            modelContext.insert(Settings())
        }
    }
}
