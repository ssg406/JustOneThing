//
//  NotificationManager.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/22/24.
//
import Foundation
import UserNotifications

final class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    
    #if DEBUG
    private let notificationDelay: TimeInterval = 15
    #else
    private let notificationDelay: TimeInterval = 60 * 60
    #endif
    
    static let shared = NotificationManager()
    
    
    private override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
        self.setNotificationActions()
    }
    
    private func setNotificationActions() {
        Log.notifications.debug("[NotificationManager] Setting notification actions")
        let markDoneAction = UNNotificationAction(identifier: C.Notifications.markDoneAction, title: "Done", options: [], icon: .init(systemImageName: "checkmark"))
        let snoozeAction = UNNotificationAction(identifier: C.Notifications.snoozeAction, title: "Snooze", options: [], icon: .init(systemImageName: "clock"))
        let todoCategory = UNNotificationCategory(identifier: C.Notifications.category, actions: [markDoneAction, snoozeAction], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "", options: .customDismissAction)
        
        UNUserNotificationCenter.current().setNotificationCategories([todoCategory])
    }
    
    func requestNotificationPermission() async {
        do {
            Log.notifications.debug("[NotificationManager] Requestion permissions from user")
            try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
        } catch {
            Log.notifications.error("[NotificationManager] Permission request failed: \(error.localizedDescription)")
        }
    }
    
    func scheduleNotification(for todo: TodoItem) async {
        // Get current permissions
        let settings = await UNUserNotificationCenter.current().notificationSettings()
        if settings.authorizationStatus != .authorized  {
            await requestNotificationPermission()
        }
        
        // Ensure todo was not completed before notification request
        guard !todo.isDone else {
            Log.notifications.debug("[NotificationManager] Todo was already completed, skipping notification")
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
            Log.notifications.debug("[NotificationManager] Notification scheduled for \(todo.id)")
        } catch {
            Log.notifications.error("[NotificationManager] Error adding request: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        
        let userInfo = response.notification.request.content.userInfo
        Log.notifications.debug("[NotificationManager] Received notification response: \(userInfo)")
        Log.notifications.debug("[NotificationManager] Notification action: \(response.actionIdentifier)")
        // Check ID ws received and todo was found
        guard let todoId = userInfo[C.Notifications.todoId] as? String else {
            Log.notifications.warning("[NotificationManager] Could not get ID from info")
            return
        }
        guard let todo = try? TodoManager.shared.todoByID(id: todoId) else {
            Log.notifications.warning("[NotificationManager] Could not find todo from ID")
            return
        }
        
        // Check notifification action
        switch response.actionIdentifier {
        case C.Notifications.markDoneAction:
            do {
                try TodoManager.shared.markTodoComplete(id: todo.id)
            } catch {
                Log.notifications.error("[NotificationManager] Error when marking todo complete: \(error.localizedDescription)")
            }
        case C.Notifications.snoozeAction:
            await self.scheduleNotification(for: todo)
        default:
            Log.notifications.warning("[NotificationManager] Invalid action identifier: \(response.actionIdentifier)")
        }
        
    }
    
}
