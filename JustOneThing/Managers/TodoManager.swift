//
//  TodoManager.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/22/24.
//
import SwiftData
import Foundation

enum TodoManagerError: Error {
    case notFound(id: String)
    case saveFailed(id: String)
    case deleteFailed(id: String)
    case updateFailed(id: String)
}

@MainActor
final class TodoManager: NSObject {
    
    static let shared = TodoManager()
    
    let container: ModelContainer
    
    private override init() {
        let schema = Schema([
            TodoItem.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            Log.todoManager.debug("(Init) container created successfully")
        } catch {
            Log.todoManager.critical("(Init) Could not create ModelContainer: \(error)")
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    
    func allTodos() throws -> [TodoItem] {
        try container.mainContext.fetch(FetchDescriptor<TodoItem>())
    }
    
    func addTodo(_ todo: TodoItem) throws {
        container.mainContext.insert(todo)
        try container.mainContext.save()
    }
    
    func updateTodo(_ todo: TodoItem) throws {
        // not implemented
    }
    
    func deleteTodo(_ todo: TodoItem) throws {
        container.mainContext.delete(todo)
        try container.mainContext.save()
    }
    
    func todoByID(id: PersistentIdentifier) throws -> TodoItem {
        let predicate = #Predicate<TodoItem> { $0.persistentModelID == id }
        let foundTodos = try container.mainContext.fetch(FetchDescriptor<TodoItem>(predicate: predicate))
        
        guard let todo = foundTodos.first else {
            throw TodoManagerError.notFound(id: "\(id)")
        }
        return todo
    }
    
    func markTodoComplete(id: PersistentIdentifier) throws {
        do {
            let todo = try todoByID(id: id)
            todo.isDone = true
            try container.mainContext.save()
        } catch {
            Log.todoManager.error("Error marking todo as complete: \(error.localizedDescription)")
            print("Error marking todo as complete: \(error.localizedDescription)")
            throw TodoManagerError.updateFailed(id: "\(id)")
        }
    }
}
