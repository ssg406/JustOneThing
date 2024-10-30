//
//  TodoItemListView.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/25/24.
//
import SwiftUI
import SwiftData

struct TodoItemList: View {
    @Environment(\.dismiss) private var dismiss
    @Query(animation: .default) private var todoItems: [TodoItem]
    @Environment(\.modelContext) private var context
    
    var noTodoItems: Bool {
        todoItems.isEmpty
    }
    var body: some View {
        ZStack {
            BlueGradientBackground()
            VStack {
                if noTodoItems {
                    Text("It's an easy life")
                        .bodyText()
                        .bold()
                } else {
                    List {
                        ForEach(todoItems) { item in
                            TodoItemListCell(item: item)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(.plain)
                }
            }
            .padding(.top, 0)
            .navigationBarBackButtonHidden()
            .toolbar { NavigationToolbar(noTodoItems ? "Nothing Here" :"Everything") {
                dismiss()
            }}
        }
    }
}

#Preview {
    NavigationStack {
        TodoItemList()
            .modelContainer(PreviewDataProvider.previewContainer)
    }
}
