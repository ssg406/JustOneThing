//
//  TodoItemListView.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/25/24.
//
import SwiftUI
import SwiftData

struct TodoItemList: View {
    
    @Query var todoItems: [TodoItem]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(todoItems) { item in
                        TodoItemListCell(item)
                    }

                    NavigationLink {
                        NewTodoItem()
                    } label: {
                        Label("New Item", systemImage: "plus")
                    }

                }
                .listStyle(.plain)
            }
            .navigationTitle("All Items")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TodoItemList()
        .modelContainer(PreviewDataProvider.previewContainer)
}
