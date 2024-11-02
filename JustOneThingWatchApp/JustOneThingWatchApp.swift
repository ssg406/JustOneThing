//
//  JustOneThingWatchApp.swift
//  JustOneThingWatch Watch App
//
//  Created by Samuel Jones on 10/28/24.
//

import SwiftUI
import SwiftData

@main
struct JustOneThingWatch_Watch_AppApp: App {
    
    let modelContainer: ModelContainer
    
    init() {
        self.modelContainer = TodoManager.shared.container
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(modelContainer)
        }
    }
}
