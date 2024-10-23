//
//  BodyText.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/20/24.
//
import SwiftUI

struct BodyText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .quicksand(16.0, relativeTo: .body)
    }
}

extension View {
    func bodyText() -> some View {
        self.modifier(BodyText())
    }
}
