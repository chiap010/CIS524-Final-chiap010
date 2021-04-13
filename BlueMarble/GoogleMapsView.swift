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
import SwiftUI
import GoogleMaps
import Combine

struct HomeView: UIViewRepresentable {

    // Listen to changes on the locationManager
    @ObservedObject var locationManager = LocationManager()

    func makeUIView(context: Self.Context) -> GMSMapView {

        // Just default the camera to anywhere (this will be overwritten as soon as myLocation is grabbed
        let camera = GMSCameraPosition.camera(withLatitude: 0, longitude: 0, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.setMinZoom(14, maxZoom: 20)
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        mapView.settings.rotateGestures = true
        mapView.settings.tiltGestures = true
        mapView.isIndoorEnabled = false

        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Self.Context) {

        // When the locationManager publishes updates, respond to them
        if let myLocation = locationManager.lastKnownLocation {
            mapView.animate(toLocation: myLocation.coordinate)
            print("User's location: \(myLocation)")
        }
    }
}
