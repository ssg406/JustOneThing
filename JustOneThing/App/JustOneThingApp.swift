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
// TODO: Watch app for quick-adding todo
// TODO: 'Streak' counting functionality
// TODO: Widget for adding or getting todo
// TODO: Allow items to be put back into deck with at time delay before they are selected

@main
struct JustOneThingApp: App {
    
    let container: ModelContainer
    let colorScheme: ColorScheme?
    
    init() {
        
        // Create dependencies
        container = TodoManager.shared.container
        let containerDependency = container
        let notificationManagerDependency = NotificationManager.shared
        
        // Add Dependency Manager Dependencies
        AppDependencyManager.shared.add(key: C.Keys.modelContainer, dependency: containerDependency)
        AppDependencyManager.shared.add(key: C.Keys.notificationManager, dependency: notificationManagerDependency)
        
        // Enable forcing of dark mode, if not nil is default behavior
        colorScheme = SettingsManager.shared.forceDarkMode ? .dark : nil
        
    }

    var body: some Scene {
        WindowGroup {
            Home()
                .preferredColorScheme(colorScheme)
        }
        .modelContainer(container)
    }
}
