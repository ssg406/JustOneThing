//
//  GetTodo.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/28/24.
//
import SwiftUI
import SwiftData

struct GetTodo: View {
    
    @Query private var todos: [TodoItem]
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTodo: TodoItem?
    @State private var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                WordJumblingAnimation(selectedTodo?.name ?? "")
                    
            }
        }
        .ignoresSafeArea()
        .onAppear {
            guard let todo = todos.randomElement() else {
                showAlert = true
                return
            }
            Task {
                try? await Task.sleep(for: .seconds(4))
                selectedTodo = todo
            }
        }
        .alert("Unable to get todo", isPresented: $showAlert) {
            Button("Okay", role: .cancel) {
                dismiss()
            }
        }
    }
}

#Preview {
    GetTodo()
}
