//
//  StreakManager.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/28/24.
//
import Foundation

@Observable
final class StreakManager {
        
    var currentStreak: KeyValueStoredObject<Int>
    var maxStreak: KeyValueStoredObject<Int>
    
    init() {
        currentStreak = .init(from: C.Keys.currentStreak)
        maxStreak = .init(from: C.Keys.maxStreak)
    }
    
    func endStreak() {

    }
    
}


