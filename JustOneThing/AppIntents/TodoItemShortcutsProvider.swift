//
//  JustOneThing_ShortcutsProvider.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/15/24.
//

import AppIntents

struct TodoItemsShortcutsProvider: AppShortcutsProvider {
    
    @AppShortcutsBuilder
    static var appShortcuts: [AppShortcut] {
        
        AppShortcut(
            intent: GetTodoItemIntent(),
            phrases: [
                "Give me just one thing",
                "Give me a todo from \(.applicationName)",
                "Pick an item from \(.applicationName)"
            ],
            shortTitle: "Get Todo Item",
            systemImageName: "checkmark.circle"
        )
        AppShortcut(
            intent: CreateTodoItemIntent(),
            phrases: [
                "Add an item to \(.applicationName)",
                "Create a todo in \(.applicationName)",
                "Add a new todo item"
            ],
            shortTitle: "Add Todo Item",
            systemImageName: "plus.circle"
        )
    }
}
