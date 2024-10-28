//
//  Settings.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/25/24.
//
import SwiftUI

struct Settings: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        @Bindable var settingsManager = SettingsManager.shared
        ZStack {
            BlueGradientBackground()
            VStack {
                List {
                    Toggle("Delete Completed Items", isOn: $settingsManager.deleteCompleted)
                        .settingsItemBackground()
                    
                    Toggle("Sync with iCloud", isOn: $settingsManager.cloudSync)
                        .settingsItemBackground()
                    
                }
                .listStyle(.plain)
            }
            .tint(.blue)
            .scrollContentBackground(.hidden)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            NavigationToolbar("Settings") { dismiss() }
        }
        .bodyText()
    }
}

#Preview {
    NavigationStack {
        Settings()
    }
}
