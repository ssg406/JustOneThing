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
            Text("Just One Thing")
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

