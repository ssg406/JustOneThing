//
//  ImageButton.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/21/24.
//
import SwiftUI

struct ImageButton: View {
    
    let image: String
    let onTap: () -> Void
    
    init(_ image: String, onTap: @escaping () -> Void = {}) {
        self.image = image
        self.onTap = onTap
    }
    
    var body: some View {
        Image(systemName: image)
            .onTapGesture(perform: onTap)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.regularMaterial)
            .shadow(radius: 15.0)
            .padding(.vertical)
    }
}

#Preview {
    ImageButton("play.circle") {}
}
