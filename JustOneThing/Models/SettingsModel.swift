//
//  SettingsModel.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/29/24.
//
import Foundation
import SwiftData

@Model
final class SettingsModel {
    
    var deleteCompleted: Bool = false
    var forceDarkMode: Bool = false
    var cloudSync: Bool = true
    var notificationsEnabled: Bool = true
    var notificationTimeInterval: TimeInterval = 3600
    var currentStreak: Int = 0
    var maxStreak: Int = 0
    
    init(deleteCompleted: Bool = false, forceDarkMode: Bool = false, cloudSync: Bool = true, notificationsEnabled: Bool = true, notificationTimeInterval: TimeInterval = 3600, currentStreak: Int = 0, maxStreak: Int = 0) {
        self.deleteCompleted = deleteCompleted
        self.forceDarkMode = forceDarkMode
        self.cloudSync = cloudSync
        self.notificationsEnabled = notificationsEnabled
        self.notificationTimeInterval = notificationTimeInterval
        self.currentStreak = currentStreak
        self.maxStreak = maxStreak
    }
    
    func breakStreak() {
        if currentStreak > maxStreak {
            maxStreak = currentStreak
        }
        currentStreak = 0
    }
}
