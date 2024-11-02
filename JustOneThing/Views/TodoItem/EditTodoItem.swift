//
//  EditTodoItem.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/20/24.
//
import SwiftUI
import JustOneThingUI

struct EditTodoItem: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var model: TodoItem
    var body: some View {


        ZStack {
            GradientBackground(.blueGreen)
            VStack {
                VStack(alignment: .leading) {
                    Text("Item Name")
                        .quicksandHeadline()
                    Divider()
                    TextField("Todo Item Name", text: $model.name)
                        .textInputAutocapitalization(.words)
                }
                .formItemBackground()
                
                
                
                VStack(alignment: .leading) {
                    Text("Why is this important?")
                        .quicksandHeadline()
                    Divider()
                    TextField("Why is this important?", text: $model.whyItsImportant, axis: .vertical)
                        .lineLimit(3, reservesSpace: true)
                }
                .formItemBackground()
                
                
                
                VStack(alignment: .leading) {
                    Text("What do you need?")
                        .quicksandHeadline()
                    Divider()
                    TextField("What do you need?", text: $model.whatDoYouNeed, axis: .vertical)
                        .lineLimit(3, reservesSpace: true)
                }
                .formItemBackground()
                
                
                VStack(alignment: .leading) {
                    Text("How hard is it?")
                        .quicksandHeadline()
                    Divider()
                    TaskDifficultyPicker(selectedDifficulty: $model.howHardIsIt)
                }
                .formItemBackground()
                
                Button("Done", systemImage: "checkmark.circle") {
                    dismiss()
                }
                .buttonText()
                .formItemBackground()
                .padding(.top)
            }
            .toolbar {
                NavigationToolbar("Edit Item") { dismiss() }
            }
            .padding(.horizontal)
            .tint(.primary)
            .quicksandBody()
        }

        }
    
}


#Preview {
    NavigationStack {
        EditTodoItem(model: TodoItem.examples.first!)
    }
}
