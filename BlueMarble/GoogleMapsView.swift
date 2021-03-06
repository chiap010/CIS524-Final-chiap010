//
//  GoogleMapsView.swift
//  BlueMarble
//
//  Created by Tommy Chiapete on 3/24/21.
//

import SwiftUI
import UIKit
import GoogleMaps
//
//
//// 42.64389021399087   -87.85278701871134
//
//https://www.andyibanez.com/posts/using-corelocation-with-swiftui/
//


struct MapView: UIViewRepresentable {
    
    // Just some tester markers until I can connect markers to Firebase
    let marker1 : GMSMarker = GMSMarker()
    let marker2 : GMSMarker = GMSMarker()
    
    // Listen to changes on the locationManager
    @ObservedObject var locationManager = LocationManager()
    
    func makeUIView(context: Self.Context) -> GMSMapView {
        
        // Just default the camera to anywhere - this will be overwritten when GPS coordinates received.
        let camera = GMSCameraPosition.camera(withLatitude: 42.643890, longitude: -87.85278, zoom: 13.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.setMinZoom(14, maxZoom: 20)
        
        // Updating settings to mapView
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        mapView.settings.rotateGestures = true
        mapView.settings.tiltGestures = true
        mapView.isIndoorEnabled = false
        
        // Return the UIViewRepresentable
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Self.Context) {
        
        // When the locationManager publishes updates, respond to them
        if let myLocation = locationManager.lastKnownLocation {
            mapView.animate(toLocation: myLocation.coordinate)
            print("User's location: \(myLocation)")
        }
        
        // Some test markers for now to see how this works
        marker1.position = CLLocationCoordinate2D(latitude: 42.645201, longitude: -87.856591)
        marker1.title = "Title"
        marker1.snippet = "Snippet"
        marker1.map = mapView
        
        marker2.position = CLLocationCoordinate2D(latitude: 42.64689, longitude: -87.855693)
        marker2.title = "Molinaro Hall"
        marker2.snippet = "UW-Parkside"
        marker2.map = mapView
    }
}
