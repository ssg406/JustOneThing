//
//  TodoItemView.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/27/24.
//
import SwiftUI

struct TodoItemListCell: View {
    
    @Bindable var todoItem: TodoItem
    
    //MARK: View Body
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(todoItem.name)
                    .font(.headline)

                HStack {
                    imageTags
                }
                .padding(.vertical, 2)
                .foregroundStyle(.mint)
            }
            Spacer()
            Image(systemName: todoItem.completed ? "checkmark.circle" : "circle")
                .font(.headline)
            
        }
    }
    
    // MARK: Computed Property Views
    var imageTags: some View {
        Group {
            if todoItem.location != nil {
                Image(systemName: "location")
            }
            if todoItem.dueDate != nil {
                Image(systemName: "calendar")
            }
            if todoItem.minutes != nil {
               Image(systemName: "clock")
            }
        }
    }
}

extension TodoItemListCell {
    init(_ todo: TodoItem) {
        self.todoItem = todo
    }
}

// MARK: Preview
#Preview {
    struct Preview: View {
        @State var todo = TodoItem.examples.first!
        var body: some View {
            TodoItemListCell(todoItem: todo)
                .padding()
        }
    }
    return Preview()
}

