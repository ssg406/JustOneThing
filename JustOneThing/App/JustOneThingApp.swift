//
//  JustOneThingApp.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/24/24.
//

import SwiftUI
import SwiftData
import AppIntents

// easy medium hard -- potential to overthink when classifying


@main
struct JustOneThingApp: App {
    
    let container: ModelContainer
    
    init() {
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
        }
        .modelContainer(container)
    }
}
