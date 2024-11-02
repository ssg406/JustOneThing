//
//  GetTodo.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/28/24.
//
import SwiftUI
import SwiftData

struct GetTodo: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var showButtons: Bool = false
    @State private var showError: Bool = false
    let todo: TodoItem?
    
    init() {
        todo = try? TodoManager.shared.allTodos().randomElement()
        showError = todo == nil
    }
    
    var body: some View {
        ZStack {
            DarkBlueGradientBackground()
            if let todo = todo {
                VStack(spacing: 15) {
                    WordJumblingAnimation(todo.name)
                        .headlineText()
                    if showButtons {
                        VStack {
                            Button("Go!") {
                                Task {
                                    await NotificationManager.shared.scheduleNotification(for: todo)
                                }
                            }
                            .tint(.green)
                            
                            Button("No Thanks") {
                                dismiss()
                            }
                            .tint(.yellow)
                        }
                        .buttonText()
                        .transition(.scale)
                    }
                }
            }
        }
        .bodyText()
        .ignoresSafeArea()
        .onAppear {
            Task {
                try? await Task.sleep(for: .seconds(4))
                withAnimation {
                    showButtons = true
                }
            }
        }
        .alert("Could not get todo", isPresented: $showError) {
            Button("Okay", role: .cancel) {
                dismiss()
            }
        }
    }
}

#Preview {
    GetTodo()
        .modelContainer(PreviewDataProvider.previewContainer)
}
