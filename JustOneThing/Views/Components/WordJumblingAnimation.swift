//
//  WordJumblingAnimation.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/21/24.
//
import SwiftUI

struct WordJumblingAnimation: View {
    
    let finalString: String
    let maxCycles: Int
    @State private var wordJumble: [String]
    
    init(_ finalString: String, maxCycles: Int = 10) {
        self.finalString = finalString
        self.wordJumble = Array(finalString).map(String.init)
        self.maxCycles = maxCycles
    }
    
    var body: some View {
        
        HStack(spacing: 0) {
            ForEach(wordJumble, id: \.self) { letter in
                LetterSpinner(letter, maxCycles: maxCycles)
            }
        }
    }
}

struct LetterSpinner: View {
    
    let finalLetter: String
    let maxCycles: Int
    let possibleCharacters = Array("abcdefghijklmnopqrstuvwxyz").map(String.init)
    
    @State private var currentCharacter: String
    
    var cycles: Int {
        Int.random(in: 5...maxCycles)
    }
    var cycleLength: Double {
        Double.random(in: 0.2...0.8)
        
    }
    
    init(_ finalLetter: String, maxCycles: Int) {
        self.finalLetter = finalLetter
        self.currentCharacter = possibleCharacters.randomElement()!
        self.maxCycles = maxCycles
    }
    
    var body: some View {
        Text(currentCharacter)
            .task {
                for _ in 0..<cycles {
                    try? await Task.sleep(for: .seconds(cycleLength))
                    withAnimation(.easeInOut) {
                        currentCharacter = possibleCharacters.randomElement()!

                    }
                }
                
                currentCharacter = finalLetter
            }
    }

}

#Preview {
    WordJumblingAnimation("Clean counters")
}
