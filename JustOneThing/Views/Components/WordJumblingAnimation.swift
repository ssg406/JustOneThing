//
//  WordJumblingAnimation.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/21/24.
//
import SwiftUI


struct WordJumblingAnimation: View {
    
    // ID available for ForEach
    typealias Letter = (letter: String, id: UUID)
    
    let finalString: String
    let maxCycles: Int
    
    @State private var letterList: [Letter]
    
    var addLetterDelay: TimeInterval {
        TimeInterval.random(in: 0.1...0.3)
    }
    
    init(_ finalString: String, maxCycles: Int = 10) {
        self.finalString = finalString
        self.maxCycles = maxCycles
        self.letterList = [Letter]()
    }
    
    var body: some View {
        
        HStack(spacing: 0) {
            ForEach(letterList, id: \.id) { letter in
                LetterSpinner(letter.letter, maxCycles: maxCycles)
                    .transition(.blurReplace)
            }
        }
        .onAppear {
            for letter in Array(finalString).map(String.init) {

                withAnimation(.linear(duration: 2)) {
                    self.letterList.append((letter: letter, id: UUID()))
                }
            }
        }
    }
}

struct LetterSpinner: View {
    
    let finalLetter: String
    let maxCycles: Int
    let possibleCharacters = Array("abcdefghijklm nopqrstuvwxyz").map(String.init)
    
    @State private var currentCharacter: String
    
    var cycles: Int {
        Int.random(in: 5...maxCycles)
    }
    var cycleLength: Double {
        Double.random(in: 0...0.5)
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
                    withAnimation {
                        currentCharacter = possibleCharacters.randomElement() ?? "x"
                    }
                }
                withAnimation(.easeIn) {
                    currentCharacter = finalLetter
                }
            }
    }

}

#Preview {
    WordJumblingAnimation("Wash all the cats")
}
