//
//  GradientBackground.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/17/24.
//
import SwiftUI

public struct GradientBackground: View {
    
    @Environment(\.colorScheme) var colorScheme
    let gradientColors: GradientColorScheme

    public init(_ colors: GradientColorScheme) {
        self.gradientColors = colors
    }
    
    public var body: some View {
        ZStack {
            if colorScheme == .dark {
                dark
            } else {
                switch gradientColors {
                case .blueGreen:
                    blueGreen
                case .dark:
                    dark
                case .orangeRed:
                    orangeRed
                case .darkBlue:
                    darkBlue
                }
            }
        }
        .ignoresSafeArea()
    }
    
    var blueGreen: some View {
        LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    var orangeRed: some View {
        LinearGradient(colors: [.orange, .red], startPoint: .top, endPoint: .bottomTrailing)
    }
    
    var darkBlue: some View {
        LinearGradient(
            colors: [
                Color(red: 22/255, green: 34/255, blue: 42/255),
                Color(red: 58/255, green: 96/255, blue: 115/255)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }
    
    var dark: some View {
        LinearGradient(stops: [
            .init(color: .black, location: 0),
            .init(color: .white.opacity(0.1), location: 0.6)
        ], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
