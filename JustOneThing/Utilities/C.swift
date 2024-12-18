//
//  Constants.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/21/24.
//

struct C {
    
    static let bundleId = "codes.samueljones.JustOneThing"
    static let cloudKitContainer = bundleId
    
    struct Intent {
    }
    
    struct Ext {
        static let widgetKind = "JustOneThingWidget"
    }
    
    struct Keys {
        static let modelContainer = "ModelContainer"
        static let notificationManager = "NotificationManager"
        static let cloudSync = "EnableCloudSync"
        static let deleteCompleted = "DeleteCompletedTodos"
        static let forceDarkMode = "ForceDarkMode"
        static let notificationsEnabled = "NotificationsEnabled"
        static let notificationTime = "NotificationTime"
        static let currentStreak = "CurrentStreak"
        static let maxStreak = "MaxStreak"
        static let taskCompletedToday = "TaskCompletedToday"
        static let appRunCount = "AppRunCount"
    }
    
    struct Notifications {
        static let markDoneAction = "MARK_DONE_ACTION"
        static let snoozeAction = "SNOOZE_ACTION"
        static let category = "TODO_CATEGORY"
        static let todoId = "TODO_ID"
    }
    
    struct Img {
        static let questionMarkCircle = "questionmark.circle"
        static let tools = "wrench.and.screwdriver"
        static let gaugeLow = "gauge.with.dots.needle.33percent"
        static let checkCircle = "checkmark.circle"
        static let checkCircleFill = "checkmark.circle.fill"
        static let backArrow = "arrow.backward.circle"
        static let backArrowCircle = "arrow.uturn.backward"
        static let squarePlus = "plus.square"
        static let bulletList = "list.bullet.rectangle"
        static let sliders = "slider.horizontal.2.square"
        static let playCircle = "play.circle.fill"
        static let lowDifficulty = "gauge.with.dots.needle.0percent"
        static let mediumDifficulty = "gauge.with.dots.needle.50percent"
        static let hardDifficulty = "gauge.with.dots.needle.100percent"
        static let circleSlash = "circle.slash"
        static let stopwatch = "stopwatch"
        static let rightChevron = "chevron.right"
        static let runner = "figure.run"
    }
    
    struct Fonts {
        static let quickSand = "Quicksand-Regular"
        static let permanentMarker = "PermanentMarker-Regular"
    }
    
}
