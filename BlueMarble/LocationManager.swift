//
//  LocationManager.swift
//  BlueMarble
//
//  Created by Tommy Chiapete on 4/12/21.
//


// https://www.hackingwithswift.com/100/swiftui/78
//https://stackoverflow.com/questions/58346305/how-to-focus-google-maps-camera-on-users-current-location-at-startup-using-swif


import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    // Publish the user's location so subscribers can react to updates
    @Published var lastKnownLocation: CLLocation? = nil
    private let manager = CLLocationManager()

    override init() {
        super.init()
        self.manager.delegate = self
        self.manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            self.manager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Notify listeners that the user has a new location
        self.lastKnownLocation = locations.last
    }
}
