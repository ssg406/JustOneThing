//
//  CustomFontModifiers.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/18/24.
//
import SwiftUI

struct QuicksandFont: ViewModifier {
    let size: CGFloat
    let relativeTo: Font.TextStyle
    
    func body(content: Content) -> some View {
        content.font(.custom(C.Fonts.quickSand, size: size, relativeTo: relativeTo))
    }
}

struct PermanentMarkerFont: ViewModifier {
    let size: CGFloat
    let relativeTo : Font.TextStyle
    
    func body(content: Content) -> some View {
        content.font(.custom(C.Fonts.permanentMarker, size: size, relativeTo: relativeTo))
    }
}

struct ShadowsIntoLightFont: ViewModifier {
    let size: CGFloat
    let relativeTo: Font.TextStyle
    func body(content: Content) -> some View {
        content.font(.custom("ShadowsIntoLight", size: size, relativeTo: relativeTo))
    }
}

extension View {
    func quicksand(_ size: CGFloat, relativeTo: Font.TextStyle) -> some View {
        modifier(QuicksandFont(size: size, relativeTo: relativeTo))
    }
    
    func permanentMarker(_ size: CGFloat, relativeTo: Font.TextStyle) -> some View {
        modifier(PermanentMarkerFont(size: size, relativeTo: relativeTo))
    }
    
    func shadowsIntoLight(_ size: CGFloat, relativeTo: Font.TextStyle) -> some View {
        modifier(ShadowsIntoLightFont(size: size, relativeTo: relativeTo))
    }
}
