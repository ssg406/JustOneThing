//
//  HeadlineText.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/21/24.
//
import SwiftUI

struct HeadlineText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .textCase(.uppercase)
            .quicksand(14.0, relativeTo: .caption)
            .bold()
    }
}

extension View {
    
    func headlineText() -> some View {
        self.modifier(HeadlineText())
    }
}
