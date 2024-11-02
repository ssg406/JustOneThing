//
//  TodoItemDetail.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/28/24.
//
import SwiftUI
import LinkDetector
import JustOneThingUI

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
                        .quicksandHeadline()
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
                    .quicksandHeadline()
                    
                    Text(LinkDetector.detectLinks(in: todoItem.whatDoYouNeed))
                }
            }
        }
        .padding()
        .quicksandBody()
        
    }
}

#Preview {
    TodoItemDetail(todoItem: TodoItem.examples.first!)
}
