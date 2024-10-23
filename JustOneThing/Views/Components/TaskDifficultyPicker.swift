//
//  TaskDifficultyPicker.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/20/24.
//
import SwiftUI

struct TaskDifficultyPicker: View {
    @Binding var selectedDifficulty: TaskDifficulty
    let color: Color? = nil
    
    var body: some View {
        HStack {
            ForEach(TaskDifficulty.allCases, id: \.self) { difficulty in
                Text(difficulty.rawValue)
                    .headlineText()
                    .padding()
                    .if(selectedDifficulty == difficulty) { content in
                        content
                            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10.0))
                    }
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        withAnimation {
                            selectedDifficulty = difficulty
                        }
                    }
                    .transition(.opacity)
            }
        }
        .background(color ?? Color.clear, in: RoundedRectangle(cornerRadius: 20.0))
        .frame(maxWidth: .infinity)
        .bodyText()
    }
}

#Preview {
    @Previewable @State var selectedDifficulty: TaskDifficulty = .medium
    TaskDifficultyPicker(selectedDifficulty: $selectedDifficulty)
}
