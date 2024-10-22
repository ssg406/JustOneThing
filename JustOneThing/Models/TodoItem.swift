//
//  Task.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/24/24.
//
import SwiftData
import Foundation

@Model
class TodoItem {
    
    // MARK: Properties
    var name: String
    var details: String?
    var completed: Bool
    var minutes: Int?
    var dueDate: Date?
    var location: TaskLocation?
    
    
    // MARK: Initalizer
    init(name: String, details: String? = nil, completed: Bool, minutes: Int? = nil, dueDate: Date? = nil, location: TaskLocation? = nil) {
        self.name = name
        self.details = details
        self.completed = completed
        self.minutes = minutes
        self.dueDate = dueDate
        self.location = location
    }
}
