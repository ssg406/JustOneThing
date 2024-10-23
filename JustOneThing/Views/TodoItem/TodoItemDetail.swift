//
//  TodoItemDetail.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/28/24.
//
import SwiftUI
import MapKit

struct TodoItemDetail: View {

    var todoItem: TodoItem
    
    init(todoItem: TodoItem) {
        self.todoItem = todoItem
    }
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                if todoItem.whyItsImportant.isNotEmpty {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "questionmark.circle")
                            Text("Why You Said it Was Important")
                            Spacer()
                        }
                        .headlineText()
                        Text(todoItem.whyItsImportant)
                    }
                }
            }
            if todoItem.whatDoYouNeed.isNotEmpty {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: C.Img.tools)
                        Text("What you said you need")
                        Spacer()
                    }
                    .headlineText()
                    
                    Text("")
                }
            }
        }
        .padding()
        .bodyText()
        
    }
}

#Preview {
    TodoItemDetail(todoItem: TodoItem.examples.first!)
}
