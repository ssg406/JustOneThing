//
//  WorkOnItem.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/18/24.
//
import SwiftUI
import SwiftData

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
        ZStack {
            OrangeGradientBackground()
            if let todo = todo {
                VStack {
                    WordJumblingAnimation(todo.name, maxCycles: 8)
                        .permanentMarker(26, relativeTo: .title)
                    
                    if showResultView {
                        TodoItemDetail(todoItem: todo)
                            .transition(.scale)
                        
                        VStack(spacing: 25) {
                            Button("No Thanks", systemImage: "hand.thumbsdown") {
                                dismiss()
                            }
                            
                            Button("Sounds Good", systemImage: "hand.thumbsup") {
                                Task {
                                    await NotificationManager.shared.scheduleNotification(for: todo)
                                }
                                dismiss()
                            }
                        }
                        .buttonText()
                        .transition(.scale)
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .bodyText()
                .formItemBackground()
                .padding()
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar { NavigationToolbar("Just One Thing") { dismiss() } }
        .onAppear {
            Task {
                try? await Task.sleep(for: .seconds(6))
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

#Preview {
    NavigationStack {
        WorkOnItem()
            .modelContainer(PreviewDataProvider.previewContainer)
    }
}
