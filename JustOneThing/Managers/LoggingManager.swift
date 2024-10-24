//
//  LoggingManager.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/22/24.
//
import OSLog

struct Log {
    private static let subsystem = C.bundleId
    static let views = Logger(subsystem: subsystem, category: "[Views]")
    static let todoManager = Logger(subsystem: subsystem, category: "[TodoManager]")
    static let notifications = Logger(subsystem: subsystem, category: "[NotificationManager]")
    static let viewModel = Logger(subsystem: subsystem, category: "[ViewModel]")
    static let intents = Logger(subsystem: subsystem, category: "[Intents]")
}
