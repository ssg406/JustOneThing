//
//  FontModifiers.swift
//  JustOneThingUI
//
//  Created by Samuel Jones on 11/1/24.
//
import SwiftUI

// MARK: Permanent Marker Styles
public struct PermanentMarkerTitle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.custom(.permanentMarker, relativeTo: .title))
    }
}

public struct PermanentMarkerTitle2: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.custom(.permanentMarker, relativeTo: .title2))
    }
}

public struct PermanentMarkerTitle3: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.custom(.permanentMarker, relativeTo: .title3))
    }
}

public struct PermanentMarkerLargeTitle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.custom(.permanentMarker, relativeTo: .largeTitle))
    }
}

// MARK: Quicksand styles
public struct QuicksandBodyFont: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.custom(.quicksand, relativeTo: .body))
    }
}

public struct QuicksandCaption2: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.custom(.quicksand, relativeTo: .caption2))
    }
}

public struct QuicksandCaption: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.custom(.quicksand, relativeTo: .caption))
    }
}

public struct QuicksandCallout: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.custom(.quicksand, relativeTo: .callout))
    }
}

public struct QuicksandFootnote: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.custom(.quicksand, relativeTo: .footnote))
    }
}

public struct QuicksandSubheadline: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.custom(.quicksand, relativeTo: .subheadline))
    }
}

public struct QuicksandHeadline: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.custom(.quicksand, relativeTo: .headline))
            .bold()
    }
}

// MARK: View+Extension
public extension View {
    func quicksandBody() -> some View {
        modifier(QuicksandBodyFont())
    }
    
    func quicksandCaption2() -> some View {
        modifier(QuicksandCaption2())
    }
    
    func quicksandCaption() -> some View {
        modifier(QuicksandCaption())
    }
    
    func quicksandCallout() -> some View {
        modifier(QuicksandCallout())
    }
    
    func quicksandSubheadline() -> some View {
        modifier(QuicksandSubheadline())
    }
    
    func quicksandHeadline() -> some View {
        modifier(QuicksandHeadline())
    }
    
    func permanentMarkerTitle() -> some View {
        modifier(PermanentMarkerTitle())
    }
    
    func permanentMarkerTitle2() -> some View {
        modifier(PermanentMarkerTitle2())
    }
    
    func permanentMarkerTitle3() -> some View {
        modifier(PermanentMarkerTitle3())
    }
    
    func permanentMarkerLargeTitle() -> some View {
        modifier(PermanentMarkerLargeTitle())
    }
}

