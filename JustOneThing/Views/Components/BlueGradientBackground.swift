//
//  GradientBackground.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/17/24.
//
import SwiftUI

struct BlueGradientBackground: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            if colorScheme == .light {
                LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
            } else {
                LinearGradient(stops: [
                    .init(color: .black, location: 0),
                    .init(color: .white.opacity(0.1), location: 0.6)
                ], startPoint: .topLeading, endPoint: .bottomTrailing)
            }
            
        }
        .ignoresSafeArea()
    }
}

struct OrangeGradientBackground: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        Group {
            if colorScheme == .light {
                LinearGradient(colors: [.orange, .red], startPoint: .top, endPoint: .bottomTrailing)
            } else {
                LinearGradient(stops: [
                    .init(color: .black, location: 0),
                    .init(color: .white.opacity(0.1), location: 0.6)
                ], startPoint: .topLeading, endPoint: .bottomTrailing)
            }
        }
        .ignoresSafeArea()
    }
    
}

#Preview {
    BlueGradientBackground()
}
