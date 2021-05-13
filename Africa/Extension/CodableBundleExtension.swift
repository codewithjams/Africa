//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Ritwik Jamuar on 05/05/21.
//

import Foundation

extension Bundle {

    /**
     Extension function of Bundle to decode a given JSON File into a Data Class.
     */
    func decodeJSON <T : Codable> (file: String) -> T {

        // Locate the JSON File.
        guard let url = self.url(
            forResource: file, withExtension: nil
        ) else {
            fatalError("Failed to locate \(file) in the Bundle")
        }

        // Create a Property for the data.
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to create the Data from \(file) in the Bundle")
        }

        // Create a Decoder.
        let decoder = JSONDecoder()

        // Create a property for the Decoded Data.
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode the JSON File: \(file) in the Bundle")
        }

        // Return the Ready to use data.
        return loaded

    }

}
