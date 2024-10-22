//
//  TaskDifficultyPicker.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/20/24.
//
import SwiftUI

struct TaskDifficultyPicker: View{
    @Binding var selectedDifficulty: TaskDifficulty
    
    var body: some View {
        HStack {
            ForEach(TaskDifficulty.allCases, id: \.self) { difficulty in
                Text(difficulty.rawValue)
                    .padding()
                    .if(selectedDifficulty == difficulty) { content in
                        content
                            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10.0))
                            .transition(.opacity)
                    }
                    .onTapGesture {
                        withAnimation {
                            selectedDifficulty = difficulty
                        }
                    }
                
            }
            
        }
        .frame(maxWidth: .infinity)
        .formItemBackground()
        .bodyText()
    }
}

