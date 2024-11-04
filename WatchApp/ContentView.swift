//
//  ContentView.swift
//  JustOneThingWatch Watch App
//
//  Created by Samuel Jones on 10/28/24.
//

import SwiftUI
import SwiftData
import JustOneThingUI

struct ContentView: View {
    
    @Query private var todos: [TodoItem]
    var availableTodos: Bool {
        !todos.isEmpty && !todos.allSatisfy(\.isDone)
    }
    var body: some View {
        
        NavigationStack {
            ZStack {
                GradientBackground(.blueGreen)
                VStack {
                    NavigationLink {
                        AddTodo()
                    } label: {
                        Label("Add One", systemImage: C.Img.squarePlus)
                    }
                    .buttonText()
                    
                    if !todos.isEmpty {
                        NavigationLink(destination: {
                            GetTodo()
                        }, label: {
                            Label("Get One", systemImage: C.Img.runner)
                        })
                        .buttonText()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(PreviewDataProvider.previewContainer)
}
