//
//  AppToolbar.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/21/24.
//
import SwiftUI

struct PrimaryToolbar: ToolbarContent {
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text("Just 1 Thing")
                .permanentMarker(22.0, relativeTo: .title)
        }
        ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    NewTodoItem()
                } label: {
                    Label("Add a Todo Item", systemImage: C.Img.squarePlus)
                }
            }
        ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    TodoItemList()
                } label: {
                    Label("All Items", systemImage: C.Img.bulletList)
                }
            }
        ToolbarItem(placement: .topBarLeading) {
                NavigationLink {
                    Settings()
                } label: {
                    Label("Settings", systemImage: C.Img.sliders)
                }
            }

    }
}

struct NavigationBar: ToolbarContent {
    
    let titleText: String
    let confirmation: () -> Void?
    let cancellation: () -> Void?
    
    init(_ titleText: String, confirmation: @escaping () -> Void?, cancellation: @escaping () -> Void?) {
        self.titleText = titleText
        self.confirmation = confirmation
        self.cancellation = cancellation
    }
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text(titleText)
                .permanentMarker(22.0, relativeTo: .title)
        }
        
    }
    
    enum ToolbarAction {
        case back, confirm
    }
}
