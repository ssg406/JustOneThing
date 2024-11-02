//
//  AppToolbar.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/21/24.
//
import SwiftUI
import JustOneThingUI

public struct PrimaryToolbar: ToolbarContent {
    
    public var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text("Just One Thing")
                .permanentMarkerTitle3()
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

