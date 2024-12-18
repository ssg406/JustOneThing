//
//  Settings.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/25/24.
//
import SwiftUI
import JustOneThingUI

struct Settings: View {
    @Environment(\.dismiss) private var dismiss
    
    var formattedTime: String {
        let seconds = Int(SettingsManager.shared.notificationTimeSetting)
        var text: String
        if seconds > 3600 {
             text = Duration.seconds(seconds).formatted(.units(allowed: [.hours, .minutes], width: .narrow))
        } else {
            // Over five minutes
            text = Duration.seconds(seconds).formatted(.units(allowed: [.minutes], width: .narrow))
        }
        return "We'll check in after \(text)"
    }

    var body: some View {
        @Bindable var settingsManager = SettingsManager.shared
        
        ZStack {
            GradientBackground(.blueGreen)
            VStack {
                List {
                    Toggle("Delete Completed Items", isOn: $settingsManager.deleteSetting)
                        .settingsItemBackground()
                    
                    Toggle("Sync with iCloud", isOn: $settingsManager.cloudSyncSetting)
                        .settingsItemBackground()
                    
                    Toggle("Force Dark Mode", isOn: $settingsManager.darkModeSetting)
                        .settingsItemBackground()
                    
                    Toggle("Enable Checkup Notification", isOn: $settingsManager.notificationSetting)
                        .settingsItemBackground()
                    
                    if settingsManager.notificationSetting {
                        VStack(alignment: .leading) {
                            Text("Choose a time interval")
                            Slider(value: $settingsManager.notificationTimeSetting, in: (5 * 60)...(60 * 60 * 24), step: (60 * 15))
                            Text(formattedTime)
                                .quicksandCaption()
                        }
                        .settingsItemBackground()
                    }
                }
                .listStyle(.plain)
            }
            .tint(.blue)
            .scrollContentBackground(.hidden)
            .navigationBarBackButtonHidden()
            .toolbar(content: {
                NavigationToolbar("Settings") { dismiss() }
            })
            .quicksandBody()
        }
    }
}

#Preview {
    NavigationStack {
        Settings()
    }
}
