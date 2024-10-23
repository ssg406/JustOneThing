//
//  HomeView.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/25/24.
//
import SwiftUI
import SwiftData

struct Home: View {
    @Query var todoItems: [TodoItem]
    @Environment(\.modelContext) private var context
    
    var incompleteTodosExist: Bool {
        !todoItems.allSatisfy(\.isDone) && todoItems.isNotEmpty
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BlueGradientBackground()
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
