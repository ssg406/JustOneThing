//
//  NotificationManager.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/22/24.
//
import Foundation
import UserNotifications
import SwiftData

final class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    
    #if DEBUG
    private let notificationDelay: TimeInterval = 30
    #else
    private let notificationDelay: TimeInterval = 60 * 60
    #endif
    
    static let shared = NotificationManager()
    
    
    private override init() {
        super.init()
        self.setNotificationActions()
    }
    
    private func setNotificationActions() {
        let markDoneAction = UNNotificationAction(identifier: C.Notifications.markDoneAction, title: "Done", options: [], icon: .init(systemImageName: "checkmark"))
        let snoozeAction = UNNotificationAction(identifier: C.Notifications.snoozeAction, title: "Snooze", options: [], icon: .init(systemImageName: "clock"))
        let todoCategory = UNNotificationCategory(identifier: C.Notifications.category, actions: [markDoneAction, snoozeAction], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "", options: .customDismissAction)
        
        UNUserNotificationCenter.current().setNotificationCategories([todoCategory])
    }
    
    func requestNotificationPermission() async {
        do {
            try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
            print("requested notification")
        } catch {
            print("Notification permission request failed: \(error.localizedDescription)")
        }
    }
    
    func scheduleNotification(for todo: TodoItem) async {
        // Get current permissions
        let settings = await UNUserNotificationCenter.current().notificationSettings()
        if settings.authorizationStatus != .authorized  {
            await requestNotificationPermission()
        }
        
        // Valid todo, and todo was not completed
        guard !todo.isDone else {
            print("Todo was already marked completed")
            return
        }
        
        // Set content and schedule notification for 1hr
        let content = UNMutableNotificationContent()
        content.title = todo.name
        content.body = "Did you get it done? You said it was important because \(todo.whyItsImportant)"
        content.categoryIdentifier = C.Notifications.category
        content.userInfo = [C.Notifications.todoId: todo.id]
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: notificationDelay, repeats: false)
        let request = UNNotificationRequest(identifier: "\(C.bundleId)-\(todo.id)", content: content, trigger: trigger)
        
        do {
            try await UNUserNotificationCenter.current().add(request)
            print("Requested nottification")
        } catch {
            print("Error adding notification request: \(error.localizedDescription)")
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        let userInfo = response.notification.request.content.userInfo
        
        // Check ID ws received and todo was found
        guard let todoId = userInfo[C.Notifications.todoId] as? PersistentIdentifier else { return }
        guard let todo = try? await TodoManager.shared.todoByID(id: todoId) else { return }
        
        // Check notifification action
        switch response.actionIdentifier {
            case C.Notifications.markDoneAction:
            do {
                try await TodoManager.shared.markTodoComplete(id: todo.id)
            } catch {
                print("Unable to mark todo complete: \(error)")
            }
        case C.Notifications.snoozeAction:
            await self.scheduleNotification(for: todo)
        default:
            print("Invalid action identifier: \(response.actionIdentifier)")
        }
    }
    
}
