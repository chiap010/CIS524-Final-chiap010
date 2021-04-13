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
//
//
struct MapView: UIViewRepresentable {
    
    //@ObservedObject var locationViewModel = LocationViewModel()
    //@StateObject var locationViewModel = LocationViewModel()
    
    let manager = CLLocationManager()
    let marker : GMSMarker = GMSMarker()
    
    

    //    /// Creates a `UIView` instance to be presented.
    func makeUIView(context: Self.Context) -> GMSMapView {

        let camera = GMSCameraPosition.camera(withLatitude: 42.64389021, longitude: -87.85278701, zoom: 13.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        return mapView
    }

    //    /// Updates the presented `UIView` (and coordinator) to the latest
    //    /// configuration.
    func updateUIView(_ mapView: GMSMapView, context: Self.Context) {
        // Creates a marker in the center of the map.

        marker.position = CLLocationCoordinate2D(latitude: 42.64389021, longitude: -87.85278701)
        //marker.title = "Sydney"
        //marker.snippet = "Australia"
        marker.map = mapView
    }
    
}



