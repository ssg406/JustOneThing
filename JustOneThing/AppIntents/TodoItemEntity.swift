//
//  TodoItemEntity.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/15/24.
//

import AppIntents

struct TodoItemEntity: AppEntity {
    
    static var typeDisplayRepresentation = TypeDisplayRepresentation(stringLiteral: "Todo Item")
    static var defaultQuery = TodoItemEntityQuery()
    var displayRepresentation: DisplayRepresentation {
        .init(
            title: .init(stringLiteral: name),
            image: .init(systemName: "checkmark.circle.fill")
        )
    }
              
    // Maps to TodoItem
    var id: UUID
    var name: String
    var whyItsImportant: String
    var whatDoYouNeed: String
    var howHardIsIt: TaskComplexity
    
    init(id: UUID, name: String, whyItsImportant: String, whatDoYouNeed: String, howHardIsIt: TaskComplexity) {
        self.id = id
        self.name = name
        self.whyItsImportant = whyItsImportant
        self.whatDoYouNeed = whatDoYouNeed
        self.howHardIsIt = howHardIsIt
    }
    
    init(_ item: TodoItem) {
        self.id = item.id
        self.name = item.name
        self.whyItsImportant = item.whyItsImportant
        self.whatDoYouNeed = item.whatDoYouNeed
        self.howHardIsIt = item.howHardIsIt
    }

}
