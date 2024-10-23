//
//  Settings.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/25/24.
//
import SwiftUI

struct Settings: View {
    @State private var keepCompletedItems = true
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            BlueGradientBackground()
            VStack {
                List {
                    Toggle("Keep Completed Items", isOn: $keepCompletedItems)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .padding()
                        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10.0))
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
