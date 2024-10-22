//
//  TodoItemDetail.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/27/24.
//
import SwiftUI

struct NewTodoItem: View {
    
    @Bindable var todoItem: TodoItem

    var body: some View {
        Form {
            Section(header: Text("Name and Notes")){
                TextField("Name", text: $todoItem.name)
                    .textInputAutocapitalization(.words)

                TextField("Notes", text: $todoItem.details, axis: .vertical)
                    .lineLimit(3, reservesSpace: true)
                
                TextField("Link or Email", text: $todoItem.link)
                TextField("Phone Number", text: $todoItem.phone)
            }
            
            Section(header: Text("Deadline and Time Estimate")) {

            }

            
            
        }
        .padding()
    }
}

// MARK: Preview
#Preview {
    NewTodoItem(todoItem: TodoItem.examples.first!)
}
