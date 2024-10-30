//
//  ContentView.swift
//  JustOneThingWatch Watch App
//
//  Created by Samuel Jones on 10/28/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack {
            ZStack {
                BlueGradientBackground()
                VStack {
                    
                    NavigationLink {
                        AddTodo()
                    } label: {
                        Label("Add One", systemImage: C.Img.squarePlus)
                    }
                    .buttonText()
                    
                    NavigationLink {
                        AddTodo()
                    } label: {
                        Label("Start One", systemImage: C.Img.runner)
                    }
                    .buttonText()

                }

            }

        }

    }
}

#Preview {
    ContentView()
}
