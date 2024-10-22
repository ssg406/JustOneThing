//
//  Location.swift
//  JustOneThing
//
//  Created by Samuel Jones on 9/24/24.
//
import SwiftData
import CoreLocation

@Model
class TodoLocation {
    
    // MARK: Properties
    var name: String
    var lat: Double
    var long: Double
    @Relationship(inverse: \TodoItem.location)
    var tasks: [TodoItem]?
    
    // MARK: Computed Properties
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
    
    //MARK: Initializer
    init(name: String, lat: Double, long: Double) {
        self.name = name
        self.lat = lat
        self.long = long
    }
}
