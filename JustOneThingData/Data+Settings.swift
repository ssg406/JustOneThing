//
//  Data+Settings.swift
//  JustOneThingData
//
//  Created by Samuel Jones on 11/3/24.
//

import SwiftData

extension DataModel {
    
    func currentSettings() -> Settings {
        let context = ModelContext(modelContainer)
        let fetchDescriptor = FetchDescriptor<Settings>()
        if let foundSettings = try? context.fetch(fetchDescriptor).first {
            return foundSettings
        } else {
            return Settings()
        }
    }
}
