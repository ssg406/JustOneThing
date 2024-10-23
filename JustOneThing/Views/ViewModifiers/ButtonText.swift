//
//  ButtonText.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/18/24.
//

import SwiftUI

struct ButtonText: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme
    func body(content: Content) -> some View {
        content
            .font(.custom("Quicksand", size: 18, relativeTo: .headline))
            .textCase(.uppercase)
            .fontWeight(.semibold)
            .tint(.primary)
    }
}

extension View {
    func buttonText() -> some View {
        self.modifier(ButtonText())
    }
}

#Preview {
    ZStack {
        Color.blue
        Button("Hello", systemImage: "xmark") {}
            .buttonText()
    }
}
