//
//  MainView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 04/05/21.
//

import SwiftUI

struct MainView: View {

    var body: some View {

        /*
         Show a Tab like Navigation where User can navigate between different screens created.
         */
        TabView() {

            ContentView() // Default Home Page
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }

            VideoListView() // Page to show List of Videos.
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }

            MapView() // Page to show the Locations.
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }

            GalleryView() // Page to show the Photo Gallery.
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }

        }

    }

}

struct MainView_Previews: PreviewProvider {

    static var previews: some View {
        MainView()
    }

}
