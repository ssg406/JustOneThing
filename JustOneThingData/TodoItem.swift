//
//  Todo.swift
//  JustOneThingData
//
//  Created by Samuel Jones on 11/3/24.
//
import SwiftData
import Foundation

@Model
final class TodoItem {
    
    // New Properties
    var name: String = ""
    // Why is it important that you do this when it comes up?
    var whyItsImportant: String = ""
    // What do you need to gather first? Put items here like phone numbers or emails
    var whatDoYouNeed: String = ""
    // How complex is this task?
    var howHardIsIt: TaskDifficulty = TaskDifficulty.low
    var isDone: Bool = false
    
    var id: String = UUID().uuidString
    
    
    init(name: String? = nil, whyItsImportant: String? = nil, whatDoYouNeed: String? = nil, howHardIsIt: TaskDifficulty? = nil, isDone: Bool? = nil) {
        self.name = name ?? ""
        self.whyItsImportant = whyItsImportant ?? ""
        self.whatDoYouNeed = whatDoYouNeed ?? ""
        self.howHardIsIt = howHardIsIt ?? .low
        self.isDone = isDone ?? false
    }
}

extension TodoItem {

    static var examples: [TodoItem]  {
        [
            .init(name: "Cancel reservation", whyItsImportant: "I don't want to get charged for a no show", whatDoYouNeed: "Phone number: 885-454-3849", howHardIsIt: .low),
            .init(name: "Clean counters", whyItsImportant: "I want my counters to be clean and ready for me to cook", whatDoYouNeed: "All-purpose cleaner, a wiping cloth", howHardIsIt: .medium),
            .init(name: "Clear dining table", whyItsImportant: "I want it to be a nice place to sit and work", howHardIsIt: .low),
            .init(name: "Reply to mom's email", whyItsImportant: "I should communicate with my mom because I love her", whatDoYouNeed: "Computer or phone", howHardIsIt: .low)
        ]
    }
}
