//
//  TaskDifficulty.swift
//  JustOneThingData
//
//  Created by Samuel Jones on 11/3/24.
//


import AppIntents
import SwiftData

enum TaskDifficulty: String, CaseIterable, Codable {
    case low = "Easy"
    case medium = "Medium"
    case high = "Hard"
}

extension TaskDifficulty: AppEnum {
    static var caseDisplayRepresentations: [TaskDifficulty: DisplayRepresentation] {
        [
            .low: DisplayRepresentation(title: "Low", image: .init(systemName: "gauge.with.dots.needle.0percent")),
            .medium: DisplayRepresentation(title: "Medium", image: .init(systemName: "gauge.with.dots.needle.50percent")),
            .high: DisplayRepresentation(title: "High", image: .init(systemName: "gauge.with.dots.needle.100percent"))
        ]
    }
    
    static let typeDisplayRepresentation: TypeDisplayRepresentation = .init(stringLiteral: "Complexity")
}
