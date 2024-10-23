//
//  WorkOnItemViewModel.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/21/24.
//
import SwiftUI
import SwiftData

@Observable
final class TodoListModel {
    var includeDifficulty = false
    var selectedDifficulty = TaskDifficulty.medium
    var showSelectedTodo = false
    var selectedTodo: TodoItem?
    var todos: [TodoItem] = []
    var notificationDelay: TimeInterval = 10
    var showItemDetails: Bool = false
    
    init()  {
        Task {
            await fetchData()
        }
    }
    
    func fetchData() async {
        do {
            todos = try await TodoManager.shared.allTodos()
        } catch {
            Log.viewModel.error("(WorkOnItemViewModel) Error fetching todos: \(error.localizedDescription)")
        }
    }
    
    func primaryButtonClicked() {
        if showSelectedTodo {
            selectedTodo = nil
            showSelectedTodo = false
        } else {
            pickTodoItem()
        }
    }
    
    func pickTodoItem() {
        let foundTodo = todos.filter { todo in
            if includeDifficulty {
                return todo.howHardIsIt == selectedDifficulty
            }
            return true
        }
            .filter { !$0.isDone }
        .randomElement()

        guard let todo = foundTodo else { return }
        selectedTodo = todo
        showSelectedTodo = true
    }
    
    func scheduleNotification(for todo: TodoItem) {
        Task {
            await NotificationManager.shared.scheduleNotification(for: todo)
        }
    }
}
