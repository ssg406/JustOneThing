//
//  LargeTitleText.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/21/24.
//
import SwiftUI

struct LargeTitleText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .permanentMarker(32.0, relativeTo: .largeTitle)
    }
}

extension View {
    func largeTitleText() -> some View {
        self.modifier(LargeTitleText())
    }
}
