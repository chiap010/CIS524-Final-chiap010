//
//  ContentView.swift
//  BlueMarble
//
//  Created by Tommy Chiapete on 3/21/21.
//

import SwiftUI
import GoogleMaps

struct ContentView: View {
    var body: some View { 

        
        // Need a tab view for bottom navigation
        TabView {
            
            // MapView -- Google Maps rendering screen
            MapView()
                .edgesIgnoringSafeArea(.all)
                //.padding()
                
                // Map button
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
                .tag(1)
            
            // Placeholder for the news screen
            Text("Second View")
                .padding()
                
                // New button
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
                .tag(2)
        }
    }
    
}

/*
 Preview the ContentView()
 */
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
