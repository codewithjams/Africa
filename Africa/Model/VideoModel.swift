//
//  VideoModel.swift
//  Africa
//
//  Created by Ritwik Jamuar on 07/05/21.
//

import Foundation

/**
 Represents a Video of an Animal.
 */
struct Video : Codable, Identifiable {

    /**
     String as the Identification ID.
     */
    let id: String

    /**
     String as the name of the Video.
     */
    let name: String

    /**
     String as the Headline of this Video.
     */
    let headline: String

    /**
     Computed Property as String denoting the name of the Thumbnail Cover for Video found in the Assets.xcassets.
     */
    var thumbnail: String {
        "video-\(id)"
    }

}
