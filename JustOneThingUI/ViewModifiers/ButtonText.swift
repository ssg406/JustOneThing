//
//  ButtonText.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/18/24.
//

import SwiftUI

public struct ButtonText: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    public func body(content: Content) -> some View {
        content
            .quicksandHeadline()
            .textCase(.uppercase)
            .tint(.primary)
    }
}

public extension View {
    func buttonText() -> some View {
        self.modifier(ButtonText())
    }
}
