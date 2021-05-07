//
//  InsetMapView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 06/05/21.
//

import SwiftUI
import MapKit

/**
 Reusable View to render a Map with location coordinates defaulted for center of Africa.
 */
struct InsetMapView: View {

    /**
     Binding to keep track of changes in the view of the Map.
     This also dictates how map is going to work.
     */
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D( // Coordinate Location at which Map is to be displayed.
            latitude: 6.600286, // Latitude of the Location.
            longitude: 16.4377599 // Longitude of the Location.
        ),
        span: MKCoordinateSpan( // Zoom Level of the Map to be shown at the beginning.
            latitudeDelta: 60.0, // Zoom Level at Latitude.
            longitudeDelta: 60.0 // Zoom Level at Longitude.
        )
    )

    var body: some View {

        // Show Map instantiated with the selected 'region'.
        Map(coordinateRegion: $region)
            .overlay( // Add an overlay on top of Map.

                // Add a Navigation Link on this over lay, so that on it's click the user will be navigated to 'MapView'.
                NavigationLink(destination: MapView()) {

                    // Stack Icon and Text Horizontally.
                    HStack {

                        // Show the Image as Icon
                        Image(systemName: "mappin.circle")
                            .foregroundColor(Color.white) // Set Foreground Color of this Icon as White.
                            .imageScale(.large) // Scale this icon to Large.

                        Text("Locations")
                            .foregroundColor(.accentColor) // Set the Foreground Color of this Text as same as the Accent Color.
                            .fontWeight(.bold) // Set the Font Weight of this text as Bold.

                    }.padding(.vertical, 10 // Set Vertical Padding of this Stack as 10.
                    ).padding(.horizontal, 14 // Set Horizontal Padding of this Stack as 14.
                    ).background(
                        Color.black // Set Background as Black Color.
                            .opacity(0.4) // Set Opacity of this background as 40%.
                            .cornerRadius(8) // Set Corner Radius of this background as 8.
                    )

                }.padding(12 // Set Padding of this Navigation Link as 12.
                ),

                alignment: .topTrailing // Set the alignment of this Overlay to be on Top-Right corner.

            ).frame(height: 256 // Set the height of the Map as 256.
            ).cornerRadius(12 // Set the Corner Radius of Map as 12.
            )

    }

}

struct InsetMapView_Previews: PreviewProvider {

    static var previews: some View {

        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()

    }

}
