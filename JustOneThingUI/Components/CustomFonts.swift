//
//  CustomFonts.swift
//  JustOneThingUI
//
//  Created by Samuel Jones on 11/1/24.
//
import SwiftUI

public enum CustomFont: String {
    case quicksand = "Quicksand"
    case permanentMarker = "PermanentMarker-Regular"
}

public extension Font.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle: 60
        case .title: 48
        case .title2: 34
        case .title3: 24
        case .headline: 18
        case .subheadline: 16
        case .body: 18
        case .callout: 16
        case .footnote: 14
        case .caption: 12
        case .caption2: 12
        @unknown default: 8
        }
    }
}

public extension Font {
    static func custom(_ font: CustomFont, relativeTo style: Font.TextStyle) -> Font {
        custom(font.rawValue, size: style.size, relativeTo: style)
    }
}

