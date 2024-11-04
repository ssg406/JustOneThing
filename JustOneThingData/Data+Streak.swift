//
//  Data+Streak.swift
//  JustOneThingData
//
//  Created by Samuel Jones on 11/3/24.
//
import SwiftData
import SwiftUI

extension DataModel {
    
    private func getOpenStreak() throws -> Streak {
        let context = ModelContext(modelContainer)
        let descriptor = FetchDescriptor<Streak>(predicate: #Predicate {
            $0.isActive
        }, sortBy: [.init(\.start)])
        guard let streak = try? context.fetch(descriptor).first else {
            throw StreakError.noOpenStreak
        }
        return streak
    }
    
    private func endStreak() throws {
        let context = ModelContext(modelContainer)
        let streak = try getOpenStreak()
        streak.end = Date()
        try context.save()
    }
    
    private func startStreak() throws {
        let context = ModelContext(modelContainer)
        let streak = Streak(start: Date())
        context.insert(streak)
        try context.save()
    }
    
    func todoCompleted() {
        // 
    }
    
    enum StreakError: Error {
        case noOpenStreak
    }
}
