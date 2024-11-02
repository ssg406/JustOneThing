//
//  FormItemBackground.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/18/24.
//

import SwiftUI

public struct FormItemBackground: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .padding()
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 15.0))
    }
}

public extension View {
    func formItemBackground() -> some View {
        self.modifier(FormItemBackground())
    }
}
