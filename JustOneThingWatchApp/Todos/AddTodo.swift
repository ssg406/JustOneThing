//
//  AddTodo.swift
//  JustOneThingWatch Watch App
//
//  Created by Samuel Jones on 10/28/24.
//

import SwiftUI
import SwiftData

struct AddTodo: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var model: TodoModel = TodoModel()
    
    var body: some View {
        VStack {
            TextField("Name", text: $model.name)
            TextField("The why", text: $model.why)
            TextField("The what", text: $model.what)
            Button("Submit") {
                if model.validate() {
                    let todoItem = TodoItem(name: model.name, whyItsImportant: model.why, whatDoYouNeed: model.what)
                    context.insert(todoItem)
                    dismiss()
                }
            }
            .buttonText()
        }
        .alert("At least a name is required", isPresented: $model.validationError) {
            Button("OK", role: .cancel) { }
        }
        .bodyText()
    }
}

#Preview {
    AddTodo()
}
