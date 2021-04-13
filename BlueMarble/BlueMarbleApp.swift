//
//  BlueMarbleApp.swift
//  BlueMarble
//
//  Created by Tommy Chiapete on 3/21/21.
//

import SwiftUI
import GoogleMaps
import Firebase

@main
struct BlueMarbleApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    // Initialize Firebase
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

let googleApiKey = "AIzaSyC3uKplGs0pw8bvRmcTGi1EXZC9i55MYCo"

// Set up Google Maps
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    GMSServices.provideAPIKey(googleApiKey)
    
    return true
  }
}
