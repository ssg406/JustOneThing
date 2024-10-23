//
//  PreviewDataProvider.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/24/24.
//

import SwiftData

@MainActor
struct PreviewDataProvider {
    static let previewContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let schema = Schema([
                TodoItem.self
            ])
            let container = try ModelContainer(for: schema, configurations: config)
            for item in TodoItem.examples {
                container.mainContext.insert(item)
            }
          return container
        } catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
    }()
}
