//
//  TodoItemEntityQuery.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/15/24.
//

import AppIntents
import SwiftData

struct TodoItemEntityQuery: EntityQuery {
    
    func entities(for identifiers: [Entity.ID]) async throws -> [TodoItemEntity] {
        return await fetchTodoItems()
            .map(TodoItemEntity.init)
            .filter { identifiers.contains($0.id) }
    }
    
    func suggestedEntities() async throws -> [TodoItemEntity] {
        await fetchTodoItems()
            .prefix(5)
            .map(TodoItemEntity.init)
            .filter { $0.howHardIsIt == .low }
    }
    
    func fetchTodoItems() async -> [TodoItem] {
        do {
            let items = try await TodoManager.shared.allTodos()
            return items
        } catch {
            Log.intents.error("(TodoItemEntityQuery) Error fetching [TodoItem]")
            return []
        }
    }
}

extension TodoItemEntityQuery: EntityStringQuery {
    
    func entities(matching string: String) async throws -> [TodoItemEntity] {
        await fetchTodoItems()
            .filter { $0.name.contains(string) }
            .map(TodoItemEntity.init)
    }
}
