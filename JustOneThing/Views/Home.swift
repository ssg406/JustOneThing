//
//  HomeView.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/25/24.
//
import SwiftUI
import SwiftData

struct Home: View {
    @Query var todoItems: [TodoItem]
    @Environment(\.modelContext) private var context
    var body: some View {
        NavigationStack {
            ZStack {
                BlueGradientBackground()
                VStack {
                    
                    primaryOptions
                    
                }
                .toolbar { PrimaryToolbar() }
            }
        }
        .tint(.primary)
    }
    
    var primaryOptions: some View {
        VStack {
            Button("Add One Thing", systemImage: C.Img.squarePlus) {
                
            }
            .buttonText()
            .formItemBackground()
            
            
            
            Button("Start One Thing", systemImage: "figure.run") {
                
            }
            .buttonText()
            .formItemBackground()
        }
    }
}

#Preview {
    Home()
        .modelContainer(PreviewDataProvider.previewContainer)
}
