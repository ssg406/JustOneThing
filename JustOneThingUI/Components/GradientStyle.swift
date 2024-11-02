//
//  GradientStyle.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/31/24.
//
import SwiftUI

public enum GradientColorScheme: Sendable {
    case blueGreen, dark, orangeRed, darkBlue
}

public struct GradientStyle: ShapeStyle {
    
    let colors: GradientColorScheme
    
    public init(_ colors: GradientColorScheme) {
        self.colors = colors
    }
    
    public func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        
        if environment.colorScheme == .dark {
            LinearGradient(stops: [
                                .init(color: .black, location: 0),
                                .init(color: .white.opacity(0.1), location: 0.6)
                            ], startPoint: .topLeading, endPoint: .bottomTrailing)
        } else {
            switch colors {
            case .blueGreen:
                LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
            case .orangeRed:
                LinearGradient(colors: [.orange, .red], startPoint: .top, endPoint: .bottomTrailing)
            case .darkBlue:
                LinearGradient(
                    colors: [
                        Color(red: 22/255, green: 34/255, blue: 42/255),
                        Color(red: 58/255, green: 96/255, blue: 115/255)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            case .dark:
                LinearGradient(stops: [
                                    .init(color: .black, location: 0),
                                    .init(color: .white.opacity(0.1), location: 0.6)
                                ], startPoint: .topLeading, endPoint: .bottomTrailing)
            }
        }
    }
}
