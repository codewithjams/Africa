//
//  AnimalModel.swift
//  Africa
//
//  Created by Ritwik Jamuar on 05/05/21.
//

import Foundation

/**
 Represents an individual Animal.
 */
struct Animal: Codable, Identifiable {

    /**
     String as the Identification ID.
     */
    let id: String

    /**
     String as the name of the Animal.
     */
    let name: String

    /**
     String as the Headlines for this Animal.
     */
    let headline: String

    /**
     String describing this Animal.
     */
    let description: String

    /**
     String as the Website URL for further reading upon this Animal.
     */
    let link: String

    /**
     String as the name of the Image in the Assets.xcassets representing this Animal.
     */
    let image: String

    /**
     Collection of String as the Images from Assets.xcassets for various images of this Animal.
     */
    let gallery: [String]

    /**
     Collection of String as some facts about this Animal.
     */
    let fact: [String]

}
