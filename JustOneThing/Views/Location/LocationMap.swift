////
////  LocationMap.swift
////  JustOneThing
////
////  Created by Samuel Jones on 9/29/24.
////
//import SwiftUI
//import MapKit
//
//struct LocationMap: UIViewRepresentable {
//    let location: TodoLocation
//    let view = MKMapView()
//    func makeUIView(context: Context) -> MKMapView {
//        view.region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = location.coordinate
//        annotation.title = location.name
//        view.addAnnotation(annotation)
//        return view
//    }
//    func updateUIView(_ uiView: MKMapView, context: Context) {
//        // Not implemented
//    }
//}
//#Preview {
//    LocationMap(location: TodoLocation.examples.first!)
//}
