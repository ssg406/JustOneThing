//
//  Database.swift
//  JustOneThingData
//
//  Created by Samuel Jones on 11/3/24.
//
// Begin by initializing container
// Data should pull settings from swiftdata if they exist, initialize them if they don't exist
//
import SwiftUI
import SwiftData

actor DataModel {
    
    static let shared = DataModel()
    private init() { }
    
    nonisolated lazy var modelContainer: ModelContainer = {
        let container: ModelContainer
        do {
            container = try ModelContainer(for: TodoItem.self, Settings.self, Streak.self)
        } catch {
            fatalError("Unable to create model container: \(error)")
        }
        return container
    }()
}
