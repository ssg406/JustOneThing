//
//  View+Extension.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/29/24.
//
import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
