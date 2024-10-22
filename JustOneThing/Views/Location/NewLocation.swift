////
////  NewLocation.swift
////  JustOneThing
////
////  Created by Samuel Jones on 9/29/24.
////
//import SwiftUI
//
//struct LocationSearch: View {
//    
//    @Environment(\.modelContext) var context
//    @Environment(\.dismiss) var dismiss
//    @FocusState var fieldFocused: Bool
//    @State var model = LocationSearchModel()
//    
//    var body: some View {
//
//        NavigationStack {
//            List {
//                
//                Section {
//                    TextField("Enter a place name", text: $model.placeName)
//                }
//                
//                
//                TextField("Search for a place or address", text: $model.searchText)
//                    .focused($fieldFocused)
//                    .overlay(alignment: .trailing) {
//                        if fieldFocused {
//                            Image(systemName: "xmark.circle.fill")
//                                .onTapGesture {
//                                    model.clearSearchField()
//                                }
//                        } else {
//                            Image(systemName: "magnifyingglass")
//                        }
//                    }
//                ForEach(model.locations, id:\.placemark) { location in
//                    HStack {
//                        VStack(alignment: .leading) {
//                            if let name = location.placemark.name {
//                                Text(name)
//                                    .font(.headline)
//                            }
//                            if let address = location.placemark.title {
//                                Text(address)
//                                    .font(.subheadline)
//                            }
//                        }
//                        .onTapGesture {
//                            model.selectedLocation = location
//                        }
//                        
//                    }
//                    .if(location == model.selectedLocation) {
//                        $0.listRowBackground(Color.mint.opacity(0.5))
//                    }
//                }
//                Section {
//                    Button("Add Selected Location", systemImage: "plus", action: addPlace) 
//                }
//            }
//            .scrollContentBackground(.hidden)
//            .background(Color.mint.opacity(0.1).gradient)
//            .navigationTitle("Find a place")
//            .toolbar {
//                ToolbarItem(placement: .cancellationAction) {
//                    Button("Cancel") { dismiss() }
//                }
//            }
//            .tint(.mint)
//
//        }
//    }
//    
//    private func addPlace() {
//        // TODO: add complete validation
//        guard let selectedLocation = model.selectedLocation,
//              !model.placeName.isEmpty
//        else { return }
//        
//        let location = TodoLocation(model.placeName, from: selectedLocation)
//        
//        context.insert(location)
//        
//        dismiss()
//    }
//}
//
//#Preview {
//    NavigationStack {
//        LocationSearch()
//    }
//}
