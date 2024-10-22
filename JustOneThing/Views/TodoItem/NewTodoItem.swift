//
//  TodoItemDetail.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/27/24.
//
import SwiftUI
import SwiftData

struct NewTodoItem: View {
    
    @State private var model = NewTodoItemViewModel()
    @Query var locations: [TodoLocation]
    @Environment(\.modelContext) var context

    var body: some View {
        Form {
            notesSection
            
            linksSection
            
            dateAndTimeSection
            
            locationSection
            
            Button("Done", action: addTodoItem)
            
        }
        .navigationTitle("New Item")
        .background(.mint.opacity(0.2).gradient)
        .tint(.mint)
        .scrollContentBackground(.hidden)
    }
}

// MARK: Sub Views
extension NewTodoItem {
    
    func header(_ title: String) -> some View {
        Text(title)
            .textCase(.none)
            .font(.headline)
            .foregroundStyle(.secondary)
    }
    
    var notesSection: some View {
        Section(header: header("Name and Notes")){
            TextField("Name", text: $model.name)
                .textInputAutocapitalization(.words)

            TextField("Notes", text: $model.details, axis: .vertical)
                .lineLimit(3, reservesSpace: true)
        }
    }
    
    var linksSection: some View {
        Section(header: header("Relevant Links")) {
            TextField("Link or Email", text: $model.link)
            TextField("Phone Number", text: $model.phone)
        }
    }
    
    var dateAndTimeSection: some View {
        Section(header: header("Date and Time")) {
            Toggle(isOn: $model.showTimeEstimate) {
                Text("Add Time Estimate")
            }
            
            if model.showTimeEstimate {
                VStack(alignment: .leading) {
                    Text("Time Estimate: \(model.minutes ?? 0) mins")
                        .font(.caption)
                    Slider(value: $model.minutesProxy, in: 0...240, step: 1)
                    
                    if model.showTimeEstimateError {
                        Text("Enter a time estimate")
                            .font(.caption)
                            .foregroundStyle(.red)
                    }
                }
            }
            
            Toggle(isOn: $model.showDueDate) {
                Text("Add Due Date")
            }
            if model.showDueDate {
                DatePicker("Due", selection: $model.dueDate)
            }
        }
    }
    
    var locationSection: some View {
        Section(header: header("Location")) {
            Toggle(isOn: $model.showLocation) {
                Text("Add Location")
            }
            
            if model.showLocation {
                VStack(alignment: .leading) {
                    Picker("Choose Location", selection: $model.location) {
                        ForEach(TodoLocation.examples) { location in
                                Text(location.name)
                        }
                    }
                    
                    if model.showLocationError {
                        Text("Select a location")
                            .font(.caption)
                            .foregroundStyle(.red)
                            .padding(.bottom, 4)
                    }

                    Button("Add Location", systemImage: "plus") {
                        // add location
                    }
                }
            }
        }
    }
}

// MARK: Private functions
extension NewTodoItem {
    
    private func addTodoItem() {
        if !model.validate() {
            return
        }
        let item = model.createItem()
        context.insert(item)
    }
}

// MARK: Preview
#Preview {
    NavigationStack {
        NewTodoItem()
    }
}
