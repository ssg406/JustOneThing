////
////  Location.swift
////  JustOneThing
////
////  Created by Samuel Jones on 9/24/24.
////
//import SwiftData
//import MapKit
//
//// TODO: Implement in later version
//
//@Model
//class TodoLocation {
//    
//    // MARK: Properties
//    var name: String
//    var lat: Double
//    var long: Double
//    @Relationship(inverse: \TodoItem.location)
//    var tasks: [TodoItem]?
//    
//    // MARK: Computed Properties
//    var coordinate: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(latitude: lat, longitude: long)
//    }
//    
//    //MARK: Initializer
//    init(name: String, lat: Double, long: Double) {
//        self.name = name
//        self.lat = lat
//        self.long = long
//    }
//    
//    init(_ name: String, from mapItem: MKMapItem) {
//        self.name = name
//        self.lat = mapItem.placemark.coordinate.latitude
//        self.long = mapItem.placemark.coordinate.longitude
//    }
//    
//    // MARK: Sample locations
//    static let examples: [TodoLocation] = [
//        .init(name: "School", lat: 47.249057, long: -122.475843),
//        .init(name: "Work", lat: 37.33167, long: -122.03083),
//        .init(name: "School", lat: 47.247193, long: -122.439261)
//        ]
//    
//    func distance(from other: CLLocationCoordinate2D) -> Double {
//        let selfLocation = CLLocation(latitude: lat, longitude: long)
//        let otherLocation = CLLocation(latitude: other.latitude, longitude: other.longitude)
//        return selfLocation.distance(from: otherLocation)
//    }
//}
