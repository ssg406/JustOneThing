//
//  WorkOnItem.swift
//  JustOneThing
//
//  Created by Samuel Jones on 10/18/24.
//
import SwiftUI
import SwiftData
import UserNotifications

struct WorkOnItem: View {
    @Query private var items: [TodoItem]
    @State private var vm = WorkOnItemViewModel()
    
    var body: some View {
            VStack {
                if let todo = vm.selectedTodo {
                    VStack {
                        HStack {
                            WordJumblingAnimation(todo.name, maxCycles: 5)
                                .quicksand(24, relativeTo: .title)
                                .bold()
                            Image(systemName: C.Img.rightChevron)
                                .rotationEffect(vm.showItemDetails ? .degrees(90) : .degrees(0))
                        }
                        if vm.showItemDetails {
                            TodoItemDetail(todoItem: todo)
                        }
                    }
                    .onTapGesture {
                        vm.showItemDetails.toggle()
                    }
                }
                
                
                
                HStack {
                    
                    Button(vm.showSelectedTodo ? "No Thanks" : "Start", systemImage: vm.showSelectedTodo ? C.Img.backArrowCircle : C.Img.playCircle) {
                        vm.primaryButtonClicked()
                    }
                    .buttonText()
                    
                    if vm.showSelectedTodo {
                        Spacer()
                        Button("Got it!", systemImage: C.Img.stopwatch) {
                            vm.scheduleNotification()
                        }
                        .buttonText()
                    }
                    
                    
                }
                .padding(.top)
                
                if !vm.showSelectedTodo {
                    Toggle("Choose Difficulty", isOn: $vm.includeDifficulty)
                        .tint(.blue)

                    if vm.includeDifficulty {
                        TaskDifficultyPicker(selectedDifficulty: $vm.selectedDifficulty)
                    }
                }

            }
            .frame(maxWidth: .infinity)
            .bodyText()
            .formItemBackground()
            .padding()
            .animation(.easeInOut, value: vm.includeDifficulty)
            .animation(.easeInOut, value: vm.showSelectedTodo)
            .animation(.easeInOut, value: vm.showItemDetails)
        
    }
}

#Preview {
    WorkOnItem()
        .modelContainer(PreviewDataProvider.previewContainer)
}
