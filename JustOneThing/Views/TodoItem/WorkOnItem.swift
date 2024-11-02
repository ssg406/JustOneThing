//
//  WorkOnItem.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/18/24.
//
import SwiftUI
import SwiftData
import AppIntents
import JustOneThingUI

struct WorkOnItem: View {
    @Environment(\.dismiss) private var dismiss
    let todo: TodoItem?
    @State private var showResultView: Bool = false
    @State private var showError: Bool = false
    
    init() {
        todo = try? TodoManager.shared.allTodos().randomElement()
        if todo == nil {
            showError = true
        }
    }
    
    var body: some View {
        
        if let todo = todo {
            ZStack {
                GradientBackground(.orangeRed)
                VStack(spacing: 15) {
                    WordJumblingAnimation(todo.name, maxCycles: 8)
                        .permanentMarkerTitle()
                    
                    if showResultView {
                        VStack {
                            TodoItemDetail(todoItem: todo)
                                .transition(.scale)
                        }
                        .formItemBackground()
                        .transition(.scale)
                        
                        VStack(spacing: 15) {
                            Button("No Thanks", systemImage: "hand.thumbsdown") {
                                dismiss()
                            }
                            .formItemBackground()
                            
                            Button("Sounds Good", systemImage: "hand.thumbsup") {
                                Task {
                                    await NotificationManager.shared.scheduleNotification(for: todo)
                                }
                                dismiss()
                            }
                            .formItemBackground()
                        }
                        .buttonText()
                        .transition(.scale)
                    }
                }
                .quicksandBody()
                .padding()
                .navigationBarBackButtonHidden()
                .toolbar { NavigationToolbar("Just One Thing") { dismiss() } }
                .onAppear {
                    Task {
                        try? await Task.sleep(for: .seconds(4))
                        withAnimation() {
                            showResultView = true
                        }
                    }
                }
                .alert("Unable to load one thing...", isPresented: $showError) {
                    Button("OK", role: .cancel) {
                        dismiss()
                    }
                }
            }

            
        }
        
    }
}

#Preview {
    NavigationStack {
        WorkOnItem()
            .modelContainer(PreviewDataProvider.previewContainer)
    }
}
