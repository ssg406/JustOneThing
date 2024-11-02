//
//  HomeView.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/25/24.
//
import SwiftUI
import SwiftData
import JustOneThingUI

// TODO: Add path to navigation stack, navigation destination, the value can just be the view. need to create some kind of hashable that corresponds to add or start pages, and then a dynamic one that corresponds to the detail view of a todo item. inside nav destination it should be switch on the value, and return different views depending on the result. Add detail page to list of tasks, perhaps shortening the contents on the list page.
// TODO: Home has `onOpenURL` that accepts a url when a widget is clicked and sets navigation path


struct Home: View {
    @Query var todoItems: [TodoItem]
    @Environment(\.modelContext) private var context
    
    var incompleteTodosExist: Bool {
        !todoItems.allSatisfy(\.isDone) && todoItems.isNotEmpty
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                GradientBackground(.blueGreen)
                VStack {
                    
                    primaryOptions
                    
                }
                .toolbar { PrimaryToolbar() }
            }
            
        }
        .tint(.primary)

    }
    
    var primaryOptions: some View {
        VStack {
            NavigationLink {
                NewTodoItem()
            } label: {
                Label("Add One Thing", systemImage: C.Img.squarePlus)
            }
            .formItemBackground()
            
            if incompleteTodosExist {
                NavigationLink {
                    WorkOnItem()
                } label: {
                    Label("Start One Thing", systemImage: C.Img.runner)
                }
                .formItemBackground()
            }
        }
        .buttonText()
    }
}

#Preview {
    Home()
        .modelContainer(PreviewDataProvider.previewContainer)
}
