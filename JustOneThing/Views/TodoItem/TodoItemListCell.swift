//
//  TodoItemView.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/27/24.
//
import SwiftUI

struct TodoItemListCell: View {
    @Environment(\.modelContext) private var context
    var item: TodoItem
    @State private var showEditSheet = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .quicksandHeadline()
            
            if !item.whyItsImportant.isEmpty {
                HStack {
                    Image(systemName: C.Img.questionMarkCircle)
                    Text(item.whyItsImportant)
                }
                .padding(.top, 1)
            }
            
            if !item.whatDoYouNeed.isEmpty {
                HStack {
                    Image(systemName: C.Img.tools)
                Text(item.whatDoYouNeed)
                }
                .padding(.top, 1)
            }
            
            HStack {
                Image(systemName: C.Img.gaugeLow)
                Text("\(item.howHardIsIt.rawValue) difficulty")

            }
            .padding(.top, 1)
            
            HStack {
                Button("Done") {
                    withAnimation {
                        item.isDone.toggle()
                        if SettingsManager.shared.deleteSetting {
                            context.delete(item)
                        }
                    }
                }
                .buttonStyle(.borderless)
                Button("Delete") {
                    withAnimation {
                        context.delete(item)
                    }
                }
                .buttonStyle(.borderless)
                Button("Edit") {
                    showEditSheet = true
                }
                .buttonStyle(.borderless)
                
            }
            .tint(.primary)
            .textCase(.uppercase)
            .fontWeight(.semibold)
            .padding(.top, 1)
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10.0))
        .sheet(isPresented: $showEditSheet) {
            EditTodoItem(model: item)
        }
        .quicksandBody()
        .opacity(item.isDone ? 0.3 : 1)

    }
}

#Preview {
    NavigationStack {
        TodoItemListCell(item: TodoItem.examples.first!)
            .padding(.horizontal)
    }
}
