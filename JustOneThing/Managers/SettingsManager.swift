//
//  SettingsManager.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/28/24.
//
import Foundation
import SwiftUI

@Observable
final class SettingsManager {
    
    static let shared = SettingsManager()
    private init() { }
    
    let userDefaults = UserDefaults.standard
    
    var deleteCompleted: Bool {
        get {
            Log.settings.debug("Got deleteCompleted setting: \(self.deleteCompleted)")
            return userDefaults.bool(forKey: C.Keys.deleteCompleted)
        }
        set {
            Log.settings.debug("Updating deleteCompleted setting to \(newValue)")
            return userDefaults.set(newValue, forKey: C.Keys.deleteCompleted)
        }
    }
    
    var cloudSync: Bool {
        get {
            Log.settings.debug("Got cloudSync setting: \(self.cloudSync)")
            return userDefaults.bool(forKey: C.Keys.cloudSync)
        }
        set {
            Log.settings.debug("Updating cloudSync setting to \(newValue)")
            return userDefaults.set(newValue, forKey: C.Keys.cloudSync)
        }
    }
    
    var forceDarkMode: Bool {
        get {
            Log.settings.debug("Got forceDarkMode setting: \(self.forceDarkMode)")
            return userDefaults.bool(forKey: C.Keys.forceDarkMode)
        }
        set {
            Log.settings.debug("Updating forceDarkMode setting to \(newValue)")
            return userDefaults.set(newValue, forKey: C.Keys.forceDarkMode)
        }
    }
    

}

class UserDefaultsBindable<Value: Codable> {
    
    let userDefaults = UserDefaults.standard
    let wrappedValue: Value
    let key: String
    let decoder: JSONDecoder
    let encoder: JSONEncoder

    init(for value: Value) {
        self.wrappedValue = value
        self.key = UUID().uuidString
        self.decoder = JSONDecoder()
        self.encoder = JSONEncoder()
    }
    
    var binding: Binding<Value> {
        return .init {
            let data = self.retrieveData()
            return self.decodeObject(from: data)
        } set: { newValue in
            let encodedData = self.encodeObject(newValue)
            self.setData(encodedData)
        }

    }
    
    func retrieveData() -> Data {
        userDefaults.data(forKey: key) ?? Data()
    }
    
    func setData(_ data: Data) {
        userDefaults.set(data, forKey: key)
    }
    
    func decodeObject(from data: Data) -> Value {
        if let decodedObject = try? decoder.decode(Value.self, from: data) {
            return decodedObject
        } else {
            return wrappedValue
        }
    }
    
    func encodeObject(_ newValue: Value) -> Data {
        if let encoded = try? encoder.encode(newValue) {
            return encoded
        } else {
            return Data()
        }
    }

    
}
