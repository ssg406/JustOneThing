//
//  ListRowBackground.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/28/24.
//
import SwiftUI

struct SettingsItemBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .padding()
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10.0))
    }
}

extension View {
    public func settingsItemBackground() -> some View {
        modifier(SettingsItemBackground())
    }
}
