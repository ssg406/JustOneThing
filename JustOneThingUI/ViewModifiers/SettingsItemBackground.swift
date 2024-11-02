//
//  ListRowBackground.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/28/24.
//
import SwiftUI

public struct SettingsItemBackground: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .listRowBackground(Color.clear)
        #if !os(watchOS)
            .listRowSeparator(.hidden)
        #endif
            .padding()
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10.0))
    }
}

public extension View {
    func settingsItemBackground() -> some View {
        modifier(SettingsItemBackground())
    }
}
