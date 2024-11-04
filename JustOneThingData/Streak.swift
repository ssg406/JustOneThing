//
//  Streak.swift
//  JustOneThingData
//
//  Created by Samuel Jones on 11/3/24.
//
import SwiftData
import Foundation

@Model final class Streak {

    var completedTodoDates: [Date] = []

    init(completedTodoDates: [Date] = []) {
        self.completedTodoDates = completedTodoDates
    }
    
    
    
}

extension Streak {
    
}
