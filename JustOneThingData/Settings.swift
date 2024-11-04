//
//  Settings.swift
//  JustOneThingData
//
//  Created by Samuel Jones on 11/3/24.
//
import SwiftData
import Foundation

@Model final class Settings {
    var deleteCompleted: Bool = false
    var enforceDarkMode: Bool = false
    var allowCloudSync: Bool = true
    var enableTodoNotification: Bool = true
    var todoNotificationTime: TimeInterval = TimeInterval(minutes: 30)
    var dailyNotificationSetting: Bool = false
    
    init(deleteCompleted: Bool = false,
         enforceDarkMode: Bool = false,
         allowCloudSync: Bool = true,
         enableTodoNotification: Bool = true,
         todoNotificationTime: TimeInterval = .init(minutes: 30),
         dailyNotificationSetting: Bool = false
    ) {
        self.deleteCompleted = deleteCompleted
        self.enforceDarkMode = enforceDarkMode
        self.allowCloudSync = allowCloudSync
        self.enableTodoNotification = enableTodoNotification
        self.todoNotificationTime = todoNotificationTime
        self.dailyNotificationSetting = dailyNotificationSetting
    }
}
