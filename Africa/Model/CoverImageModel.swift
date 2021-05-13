//
//  CoverImageModel.swift
//  Africa
//
//  Created by Ritwik Jamuar on 05/05/21.
//

import Foundation

/**
 Represents an individual Cover Image of an Animal.
 */
struct CoverImage : Codable, Identifiable {

    /**
     Integer as a Identification ID.
     */
    let id: Int

    /**
     String as the Image File Name in the Assets.xcassets.
     */
    let name: String

}
