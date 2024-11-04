//
//  TimeInterval+Extension.swift
//  JustOneThingData
//
//  Created by Samuel Jones on 11/3/24.
//
import Foundation

extension TimeInterval {
    init(minutes: Int = 0, hours: Int = 0, days: Int = 0) {
        self.init(
            (minutes * 60) +
            (hours * 3600) +
            (days * 86400)
        )
    }
}
