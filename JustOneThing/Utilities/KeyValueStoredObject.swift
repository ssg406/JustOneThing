//
//  KeyValueStoredObject.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/29/24.
//
import Foundation

@Observable
final class KeyValueStoredObject<T>: NSObject {
    
    var value: T? {
        didSet {
            defaults.set(value, forKey: self.key)
            store.set(value, forKey: self.key)
        }
    }
    
    let key: String
    let defaults: UserDefaults
    let store: NSUbiquitousKeyValueStore
    
    init(_ value: T, key: String? = nil) {
        self.value = value
        let uuid = UUID().uuidString
        self.key = key ?? uuid
        self.defaults = .standard
        self.store = .default
    }
    
    // Initialize from existing key. If key is not found, it will be saved until first write
    init(from key: String) {
        self.defaults = .standard
        self.store = .default
        self.key = key
        
        if let value = store.object(forKey: key) as? T {
            self.value = value
        } else if let value = defaults.object(forKey: key) as? T {
            self.value = value
        } else {
            self.value = nil
        }
    }
}
