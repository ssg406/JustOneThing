//
//  TodoModel.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/28/24.
//
import Foundation

@Observable
final class TodoModel {
    var name: String
    var why: String
    var what: String
    var validationError: Bool
    
    init() {
        self.name = ""
        self.why = ""
        self.what = ""
        validationError = false
    }
    
    func validate() -> Bool {
        if name.isEmpty {
            validationError = true
            return false
        }
        return true
    }
}
