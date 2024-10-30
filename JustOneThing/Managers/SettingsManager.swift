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
    
    
    /// Initializes all settings values from either UserDefaults or NSUbiquitousKeyValueStore, which ever they exist in. If they can't be found in either, they are set to a default value.
    private init() {
        let store = NSUbiquitousKeyValueStore.default
        let defaults = UserDefaults.standard
        
        if let cloudDelete = store.dictionaryRepresentation[C.Keys.deleteCompleted] as? Bool {
            // Set value from cloud
            self.deleteSetting = cloudDelete
        } else if let defaultsDelete = defaults.object(forKey: C.Keys.deleteCompleted) as? Bool {
            self.deleteSetting = defaultsDelete
        } else {
            self.deleteSetting = false
        }
        
        if let cloudDark = store.dictionaryRepresentation[C.Keys.forceDarkMode] as? Bool {
            self.darkModeSetting = cloudDark
        } else if let defaultsDark = defaults.object(forKey: C.Keys.forceDarkMode) as? Bool {
            self.darkModeSetting = defaultsDark
        } else {
            self.darkModeSetting = false
        }
        
        
        if let cloudCloud = store.dictionaryRepresentation[C.Keys.cloudSync] as? Bool {
            self.cloudSyncSetting = cloudCloud
        } else if let defaultsCloud = defaults.object(forKey: C.Keys.cloudSync) as? Bool {
            self.cloudSyncSetting = defaultsCloud
        } else {
            self.cloudSyncSetting = true
        }
        
        if let cloudNotifications = store.dictionaryRepresentation[C.Keys.notificationsEnabled] as? Bool {
            self.notificationSetting = cloudNotifications
        } else if let defaultsNotifications = defaults.object(forKey: C.Keys.notificationsEnabled) as? Bool {
            self.notificationSetting = defaultsNotifications
        } else {
            self.notificationSetting = true
        }
        
        if let cloudTime = store.dictionaryRepresentation[C.Keys.notificationTime] as? Double {
            self.notificationTimeSetting = cloudTime
        } else if let defaultsTime = defaults.object(forKey: C.Keys.notificationTime) as? Double {
            self.notificationTimeSetting = defaultsTime
        } else {
            self.notificationTimeSetting = 3600
        }
        
        if let cloudStreak = store.dictionaryRepresentation[C.Keys.currentStreak] as? Int {
            self.currentStreak = cloudStreak
        } else if let defaultsStreak = defaults.object(forKey: C.Keys.currentStreak) as? Int {
            self.currentStreak = defaultsStreak
        } else {
            self.currentStreak = 0
        }
        
        if let cloudLongestStreak = store.dictionaryRepresentation[C.Keys.maxStreak] as? Int {
            self.longestStreak = cloudLongestStreak
        } else if let defaultsLongestStreak = defaults.object(forKey: C.Keys.maxStreak) as? Int {
            self.longestStreak = defaultsLongestStreak
        } else {
            self.longestStreak = 0
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
    
    func incrementStreak() {
        
    }
}

