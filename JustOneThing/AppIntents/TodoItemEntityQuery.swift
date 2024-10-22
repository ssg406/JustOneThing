//
//  TodoItemEntityQuery.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/15/24.
//

import AppIntents
import SwiftData

struct TodoItemEntityQuery: EntityQuery {
    
    @Dependency(key: "ModelContainer")
    var modelContainer: ModelContainer
    
    func entities(for identifiers: [Entity.ID]) async throws -> [TodoItemEntity] {
        return fetchTodoItems()
            .map(TodoItemEntity.init)
            .filter { identifiers.contains($0.id) }
    }
    
    func suggestedEntities() async throws -> [TodoItemEntity] {
        fetchTodoItems()
            .prefix(5)
            .map(TodoItemEntity.init)
            .filter { $0.howHardIsIt == .low }
    }
    
    func fetchTodoItems() -> [TodoItem] {
        let context = ModelContext(modelContainer)
        let fetchDescriptor = FetchDescriptor<TodoItem>()
        
        do {
            let todoItems = try context.fetch(fetchDescriptor)
            return todoItems
        } catch {
            print("Error fetching from SwiftData")
            return []
        }
    }
}

extension TodoItemEntityQuery: EntityStringQuery {
    
    func entities(matching string: String) async throws -> [TodoItemEntity] {
        fetchTodoItems()
            .filter { $0.name.contains(string) }
            .map(TodoItemEntity.init)
    }
}
