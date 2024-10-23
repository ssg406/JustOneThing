//
//  TodoItemIntentResultView.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/15/24.
//

import SwiftUI

struct GetTodoItemIntentResultView: View {
    
    let foundItem: TodoItem
    
    var imageNameColor: (String, Color) {
        switch foundItem.howHardIsIt {
        case .low:
            (C.Img.lowDifficulty, .green)
        case .medium:
            (C.Img.mediumDifficulty, .orange)
        case .high:
            (C.Img.hardDifficulty, .red)
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Text(foundItem.name)
                    .bold()
                
                Text(foundItem.whyItsImportant)
                    .font(.footnote)
                
                Text(foundItem.whatDoYouNeed)
                    .font(.footnote)
                
                
            }
            Spacer()
            Image(systemName: imageNameColor.0)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(imageNameColor.1)
        }
    }
}

#Preview("Get Intent Result", traits: .sizeThatFitsLayout) {
    GetTodoItemIntentResultView(foundItem: TodoItem.examples.randomElement()!)
        .padding()
}
