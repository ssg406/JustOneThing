//
//  PreviewData.swift
//  JustOneThingData
//
//  Created by Samuel Jones on 11/3/24.
//
import SwiftData
import SwiftUI

struct PreviewData: PreviewModifier {
    
    static func makeSharedContext() throws -> ModelContainer {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: TodoItem.self, configurations: config)
        PreviewData.addSampleData(to: container.mainContext)
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
    
    static func addSampleData(to context: ModelContext) {
        Task { @MainActor in
            let todos = TodoItem.examples
            todos.forEach {
                context.insert($0)
            }
            
            let streaks = Streak.examples
            streaks.forEach {
                context.insert($0)
            }
            
            let settings = Settings()
            context.insert(settings)
            
            try? context.save()
        }
    }
}

@available(iOS 18.0, *)
extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var previewData: Self = .modifier(PreviewData())
}
