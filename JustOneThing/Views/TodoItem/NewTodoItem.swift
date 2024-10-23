//
//  TodoItemDetail.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/27/24.
//
import SwiftUI
import SwiftData

struct NewTodoItem: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Bindable var model: TodoItem
    
    init() {
        model = TodoItem()
    }

    var body: some View {
        ZStack {
            BlueGradientBackground()
            VStack {
                TextField("Give it a name", text: $model.name)
                    .textInputAutocapitalization(.words)
                    .formItemBackground()
                

                TextField("Tell your future self why you should do it", text: $model.whyItsImportant, axis: .vertical)
                    .lineLimit(3, reservesSpace: true)
                    .formItemBackground()
                
                
                TextField("Note any phone numbers, emails, or URLs you'll need", text: $model.whatDoYouNeed, axis: .vertical)
                    .lineLimit(3, reservesSpace: true)
                    .formItemBackground()
                
                TaskDifficultyPicker(selectedDifficulty: $model.howHardIsIt)
                    .formItemBackground()
                
                Button("Create", systemImage: "plus") {
                    addTodoItem()
                }
                .buttonText()
                .formItemBackground()
            }
            .bodyText()
            .tint(.black)
            .padding(.horizontal)
        }
        .navigationBarBackButtonHidden()
        .toolbar { NavigationToolbar("New Item") { dismiss() }}

    }
    
    private func addTodoItem() {
        context.insert(model)
        try? context.save()
        dismiss()
    }
}

#Preview {
        NewTodoItem()
            .modelContainer(PreviewDataProvider.previewContainer)
    
}
