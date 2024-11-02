//
//  NavigationToolbar.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/21/24.
//
import SwiftUI
import JustOneThingUI

struct NavigationToolbar: ToolbarContent {
    
    let titleText: String
    let backAction: () -> Void
    
    init(_ titleText: String, backAction: @escaping () -> Void = {} ) {
        self.titleText = titleText
        self.backAction = backAction
    }
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text(titleText)
                .permanentMarkerTitle3()
        }
        
        ToolbarItem(placement: .cancellationAction) {
            Button("Back", systemImage: C.Img.backArrowCircle, action: backAction)
                .tint(.primary)
        }
    }
}
