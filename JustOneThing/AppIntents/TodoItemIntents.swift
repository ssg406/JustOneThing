//
//  JustOneThing_Intents.swift
//  JustOneThing Intents
//
//  Created by Samuel Jones on 10/15/24.
//

import AppIntents
import SwiftData
import SwiftUI
import UserNotifications

struct GetTodoItemIntent: AppIntent {
    static var title: LocalizedStringResource { "Start a Todo Item" }
    static var description: IntentDescription? { "Get a todo item from the list to start work on" }
    static var openAppWhenRun: Bool = false
    
    @Parameter(description: "Get todo items of a specific complexity")
    var howHardIsIt: TaskDifficulty?
    func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
        
        // get the item
        let item = try await getItems()
            .filter { item in
                guard let difficulty = howHardIsIt else { return true }
                return item.howHardIsIt == difficulty
            }
            .randomElement()
        
        guard let item = item else {
            return .result(dialog: "Unable to get a todo item")
        }
        
        return .result(dialog: "Time to get started", view: GetTodoItemIntentResultView(foundItem: item))
    }
    
    func getItems() async throws -> [TodoItem] {
        let context = ModelContext(modelContainer)
        let fetchDescriptor = FetchDescriptor<TodoItem>()
        let items = try context.fetch(fetchDescriptor)
        return items
    }
    
    
    @Dependency(key: "ModelContainer")
    var modelContainer: ModelContainer
}

struct CreateTodoItemIntent: AppIntent {
    static var title: LocalizedStringResource { "Create a Todo Item" }
    static var description: IntentDescription? { "Create a new todo item to add to the list" }
    static var openAppWhenRun: Bool = false
    
    func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
        let context = ModelContext(modelContainer)
        
        // Request clarification from the user if there is no value set for task complexity
        let taskDifficulty = if howHardIsIt == nil {
            try await $howHardIsIt.requestDisambiguation(among: TaskDifficulty.allCases)
        } else { howHardIsIt }
        
        let todoItem = TodoItem(name: name, whyItsImportant: whyIsItImportant, whatDoYouNeed: whatDoYouNeed, howHardIsIt: taskDifficulty)
        context.insert(todoItem)
        
        do {
            try context.save()
            return .result(dialog: "Created New Todo Item", view: GetTodoItemIntentResultView(foundItem: todoItem))
        } catch {
            print("Error saving todo item: \(error)")
            return .result(dialog: "The todo item could not be created.")
        }
    }
    
    @Parameter(description: "Complexity of todo item")
    var howHardIsIt: TaskDifficulty?
    
    @Parameter(description: "Name of the todo item")
    var name: String
    
    @Parameter(description: "Why is this important?")
    var whyIsItImportant: String?
    
    @Parameter(description: "What do you need to complete it?")
    var whatDoYouNeed: String?
    
    @Dependency(key: "ModelContainer")
    var modelContainer: ModelContainer
}
