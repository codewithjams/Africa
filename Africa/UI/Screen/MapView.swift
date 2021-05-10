//
//  MapView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 04/05/21.
//

import SwiftUI
import MapKit

/**
 View as a screen to show the Map, pointing out the Locations of the National Parks.
 */
struct MapView: View {

    /**
     Constant Collection of Locations of National Parks, fetched from JSON File.
     */
    let locations: [Location] = Bundle.main.decodeJSON(file: "locations.json")

    /**
     Map Kit Coordinate Region as a State which maintains the state of our Map View during the Screen Lifecycle.
     */
    @State private var region: MKCoordinateRegion = {

        // Create a 2D Location Coordinate to hover the Map over the Center of Africa.
        var mapCoordinates = CLLocationCoordinate2D(
            latitude: 6.600286,
            longitude: 16.4377599
        )

        // Create a Map Kit Coordinate Span to set the Zoom Level of the Map View.
        var mapZoomLevel = MKCoordinateSpan(
            latitudeDelta: 70.0,
            longitudeDelta: 70.0
        )

        // Create a region using 'mapCoordinates' and 'mapZoomLevel'.
        var mapRegion = MKCoordinateRegion(
            center: mapCoordinates,
            span: mapZoomLevel
        )

        // Return the 'mapRegion'.
        return mapRegion

    } ()

    var body: some View {

        // Show a Map in the View.
        Map(
            coordinateRegion: $region,
            annotationItems: locations,
            annotationContent: { location in

                // Show a Map Pin, denoting the Pin in the Map.
//                MapPin(
//                    coordinate: location.location,
//                    tint: .accentColor
//                )

                // Show a Map Marker, denoting the Mark Points.
//                MapMarker(
//                    coordinate: location.location,
//                    tint: .accentColor
//                )

                // Show a Generic 'MapAnnotation' with our own customization to the icon shown in the Map.
//                MapAnnotation(
//                    coordinate: location.location // Set the Location in the Map.
//                ) {
//
//                    // Show an Image 'logo' which acts as the Icon of our 'MapAnnotation'.
//                    Image("logo")
//                        .resizable() // Make this Image resizable in nature.
//                        .scaledToFit() // Make this Image scaled to fit.
//                        .frame( // Set the Width, Height and Alignment of this Image.
//                            width: 32,
//                            height: 32,
//                            alignment: .center
//                        )
//
//                }

                // Show a Custom 'MapAnnotation'.
                MapAnnotation(
                    coordinate: location.location // Set the Location in the Map.
                ) {

                    // Show the 'MapAnnotationView'.
                    MapAnnotationView(
                        location: location
                    )

                }

            }
        ).overlay(

            // Align the contents of this Map Overlay horizontally.
            HStack(
                alignment: .center,
                spacing: 12
            ) {

                // Show a Image of Compass as an icon.
                Image("compass")
                    .resizable() // Make this image as resizable in nature.
                    .scaledToFit() // Make this image scaled to fit.
                    .frame( // Set the frame dimensions of this image.
                        width: 48,
                        height: 48,
                        alignment: .center
                    )

                // Align the Latitude and Longitude contents vertically.
                VStack(alignment: .leading, spacing: 3) {

                    // Align the Placeholder and Value of Latitude Horizontally.
                    HStack {

                        // Show a Placeholder Text as 'Latitude'.
                        Text("Latitude:")
                            .font(.footnote) // Set the font of this Text as Foot Note.
                            .fontWeight(.bold) // Set the text style as Bold.
                            .foregroundColor(.accentColor) // Set the Foreground Color as same as Accent Color.

                        // Give a Space between the Placeholder and Value Text.
                        Spacer()

                        // Show a Value Text as the value of 'Latitude' of the center of the Map.
                        Text("\(region.center.latitude)")
                            .font(.footnote) // Set the font of this Text as Foot Note.
                            .fontWeight(.bold) // Set the text style as Bold.
                            .foregroundColor(.white) // Set the Foreground Color as White.

                    }

                    // Add a divider between Latitude and Longitude region.
                    Divider()

                    // Align the Placeholder and Value of Longitude Horizontally.
                    HStack {

                        // Show a Placeholder Text as 'Longitude'.
                        Text("Longitude:")
                            .font(.footnote) // Set the font of this Text as Foot Note.
                            .fontWeight(.bold) // Set the text style as Bold.
                            .foregroundColor(.accentColor) // Set the Foreground Color as same as Accent Color.

                        // Give a Space between the Placeholder and Value Text.
                        Spacer()

                        // Show a Value Text as the value of 'Longitude' of the center of the Map.
                        Text("\(region.center.longitude)")
                            .font(.footnote) // Set the font of this Text as Foot Note.
                            .fontWeight(.bold) // Set the text style as Bold.
                            .foregroundColor(.white) // Set the Foreground Color as White.

                    }

                }

            }.padding( // Set Vertical Padding of this Overlay as 12.
                .vertical,
                12
            ).padding( // Set Horizontal Padding of this Overlay as 16.
                .horizontal,
                16
            ).background( // Set the Background of this Overlay as Black Color being rounded rectangle and translucent opacity.
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            ).padding( // Provide overall padding to this Overlay.
            ),
            alignment: .top // Align this Overlay on the Top.

        )

    }

}

struct MapView_Previews: PreviewProvider {

    static var previews: some View {
        MapView()
    }

}
