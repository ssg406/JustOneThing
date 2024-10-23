//
//  TodoItemEntity.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/15/24.
//

import AppIntents

struct TodoItemEntity: AppEntity {

    static var typeDisplayRepresentation =  TypeDisplayRepresentation(name: "Todo Item")
    static var defaultQuery = TodoItemEntityQuery()
    var displayRepresentation: DisplayRepresentation {
        .init(
            title: .init(stringLiteral: name),
            image: .init(systemName: isDone ? C.Img.checkCircleFill : C.Img.circleSlash)
        )
    }
              
    // Maps to TodoItem
    var id: String
    var name: String
    var whyItsImportant: String
    var whatDoYouNeed: String
    var howHardIsIt: TaskDifficulty
    var isDone: Bool
    
    init(id: String, name: String, whyItsImportant: String, whatDoYouNeed: String, howHardIsIt: TaskDifficulty, isDone: Bool) {
        self.id = id
        self.name = name
        self.whyItsImportant = whyItsImportant
        self.whatDoYouNeed = whatDoYouNeed
        self.howHardIsIt = howHardIsIt
        self.isDone = isDone
    }
    
    init(_ item: TodoItem) {
        self.id = item.id
        self.name = item.name
        self.whyItsImportant = item.whyItsImportant
        self.whatDoYouNeed = item.whatDoYouNeed
        self.howHardIsIt = item.howHardIsIt
        self.isDone = item.isDone
    }

}
