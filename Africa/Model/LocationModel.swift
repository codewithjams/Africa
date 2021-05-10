//
//  Location.swift
//  Africa
//
//  Created by Ritwik Jamuar on 09/05/21.
//

import Foundation
import MapKit

/**
 Represents a Location for a National Park.
 */
struct Location: Codable, Identifiable {

    /**
     Constant `String` as an Identification Identifier.
     */
    let id: String

    /**
     Constant `String` as the name of the Location.
     */
    let name: String

    /**
     Constant `String` as the name of the Image File name under `Assets.xcassets`.
     */
    let image: String

    /**
     Constant `Double` as the value of Latitude.
     */
    let latitude: Double

    /**
     Constant `Double` as the value of Longitude.
     */
    let longitude: Double

    /**
     Initializes a `Location` with the parameters given below.
     
     - Parameter id: `String` as an identification identifier.
     - Parameter name: `String` as the name of the Location.
     - Parameter image: `String` as the name of the Image File name under `Assets.xcassets`.
     - Parameter latitude: `Double` value denoting the Latitude.
     - Parameter longitude: `Double` value denoting the Longitude.
     */
    init(
        id: String,
        name: String,
        image: String,
        latitude: Double,
        longitude: Double
    ) {
        self.id = id
        self.name = name
        self.image = image
        self.latitude = latitude
        self.longitude = longitude
    }

    /**
     Computed Propery as `CLLocationCoordinate2D` made out of `latitude` and `longitude` given.
     */
    var location: CLLocationCoordinate2D {

        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )

    }

}
