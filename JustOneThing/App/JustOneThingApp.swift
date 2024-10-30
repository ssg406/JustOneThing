//
//  JustOneThingApp.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/24/24.
//

import SwiftUI
import SwiftData
import AppIntents

// TODO: Re-factor difficulty selection to be simpler and avoid users overthinking the choice
// TODO: 'Streak' counting functionality
// TODO: Widget for adding or getting todo
// TODO: Allow items to be put back into deck with at time delay before they are selected

@main
struct JustOneThingApp: App {
    
    let container: ModelContainer
    
    init() {
        
        // Create dependencies
        container = TodoManager.shared.container
        let containerDependency = container
        let notificationManagerDependency = NotificationManager.shared
        
        // Add Dependency Manager Dependencies
        AppDependencyManager.shared.add(key: C.Keys.modelContainer, dependency: containerDependency)
        AppDependencyManager.shared.add(key: C.Keys.notificationManager, dependency: notificationManagerDependency)
    
    }

    var body: some Scene {
        WindowGroup {
            Home()
                .preferredColorScheme(SettingsManager.shared.darkModeSetting ? .dark : nil)
        }
        .modelContainer(container)
    }
}
