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

        
        
        TabView {
            
            HomeView()
                .edgesIgnoringSafeArea(.all)
                //.padding()
                .tabItem {
                    Image(systemName: "map")
                    //Text("Map")
                }
                .tag(1)
            Text("Second View")
                .padding()
                .tabItem {
                    Image(systemName: "newspaper")
                    //Text("News")
                }
                .tag(2)
        }
    }
    
}


//struct MapView:  View {

//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
