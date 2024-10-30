//
//  SettingsManager.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/28/24.
//
import Foundation


@Observable
final class SettingsManager {
    
    static let shared = SettingsManager()
    
    var deleteSetting: Bool {
        didSet { updateValue(for: C.Keys.deleteCompleted, value: deleteSetting) }
    }
    var darkModeSetting: Bool {
        didSet { updateValue(for: C.Keys.forceDarkMode, value: darkModeSetting) }
    }
    var cloudSyncSetting: Bool {
        didSet { updateValue(for: C.Keys.cloudSync, value: cloudSyncSetting) }
    }
    var notificationSetting: Bool {
        didSet { updateValue(for: C.Keys.notificationTime, value: notificationSetting) }
    }
    var notificationTimeSetting: TimeInterval {
        didSet { updateValue(for: C.Keys.notificationTime, value: notificationTimeSetting) }
    }
    var currentStreak: Int {
        didSet { updateValue(for: C.Keys.currentStreak, value: currentStreak)}
    }
    private(set) var longestStreak: Int {
        didSet { updateValue(for: C.Keys.currentStreak, value: longestStreak) }
    }
    
    private init() {
        let store = NSUbiquitousKeyValueStore.default
        let defaults = UserDefaults.standard
        if let delete = store.dictionaryRepresentation[C.Keys.deleteCompleted] as? Bool {
            Log.settings.debug("[SettingsManager] Delete setting found in cloud")
            self.deleteSetting = delete
        } else {
            Log.settings.debug("[SettingsManager] Delete setting found in defaults")
            self.deleteSetting = defaults.bool(forKey: C.Keys.deleteCompleted)
        }
        
        if let dark = store.dictionaryRepresentation[C.Keys.forceDarkMode] as? Bool {
            Log.settings.debug("[SettingsManager] Dark mode setting found in cloud")
            self.darkModeSetting = dark
        } else {
            Log.settings.debug("[SettingsManager] Dark mode setting found in defaults")
            self.darkModeSetting = defaults.bool(forKey: C.Keys.forceDarkMode)
        }
        
        if let cloud = store.dictionaryRepresentation[C.Keys.cloudSync] as? Bool {
            Log.settings.debug("[SettingsManager] Cloud sync setting found in cloud")
            self.cloudSyncSetting = cloud
        } else {
            Log.settings.debug("[SettingsManager] Cloud sync setting found in defaults")
            self.cloudSyncSetting = defaults.bool(forKey: C.Keys.cloudSync)
        }
        
        if let notification = store.dictionaryRepresentation[C.Keys.notificationsEnabled] as? Bool {
            Log.settings.debug("[SettingsManager] Nofication setting found in cloud")
            self.notificationSetting = notification
        } else {
            Log.settings.debug("[SettingsManager] Notification setting found in defaults")
            self.notificationSetting = defaults.bool(forKey: C.Keys.notificationsEnabled)
        }
        
        if let time = store.dictionaryRepresentation[C.Keys.notificationTime] as? Double {
            Log.settings.debug("[SettingsManager] Notification time setting found in cloud")
            self.notificationTimeSetting = time
        } else {
            Log.settings.debug("[SettingsManager] Notification time setting found in defaults")
            let storedTimeInterval = defaults.double(forKey: C.Keys.notificationTime)
            self.notificationTimeSetting = if storedTimeInterval == 0 { 3600 } else { storedTimeInterval }
        }
        
        if let streak = store.dictionaryRepresentation[C.Keys.currentStreak] as? Int {
            Log.settings.debug("[SettingsManager] Current streak found in cloud")
            self.currentStreak = streak
        } else {
            Log.settings.debug("[SettingsManager] Current streak found in defaults")
            self.currentStreak = defaults.integer(forKey: C.Keys.currentStreak)
        }
        
        if let longStreak = store.dictionaryRepresentation[C.Keys.maxStreak] as? Int {
            Log.settings.debug("[SettingsManager] Max streak found in cloud")
            self.longestStreak = longStreak
        } else {
            Log.settings.debug("[SettingsManager] Max streak found in defaults")
            self.longestStreak = defaults.integer(forKey: C.Keys.maxStreak)
        }
    }

    private func updateValue<T>(for key: String, value: T) {
        UserDefaults.standard.set(value, forKey: key)
        NSUbiquitousKeyValueStore.default.set(value, forKey: key)
    }
    
    func endStreak() {
        Log.settings.debug("[SettingsManager] End streak called")
        if currentStreak > longestStreak {
            longestStreak = currentStreak
        }
        currentStreak = 0
    }
}

