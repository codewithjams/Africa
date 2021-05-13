//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 12/05/21.
//

import SwiftUI

/**
 Reusable View to render the Image of an `Animal`.
 */
struct AnimalGridItemView: View {

    /**
     Final Reference of `Animal` denoting the Animal whose image we want to show,
     */
    let animal: Animal

    var body: some View {

        // Show the image of an Animal.
        Image(animal.image)
            .resizable() // Make this image resizable in nature.
            .scaledToFit() // Make this image scaled to fit.
            .cornerRadius(12) // Set the radius of corners as 12.

    }

}

struct AnimalGridItemView_Previews: PreviewProvider {

    /**
     Procure the List of `Animals` from the JSON File statically for preview purpose.
     */
    private static let animals: [Animal] = Bundle.main.decodeJSON(file: "animals.json")

    static var previews: some View {

        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()

    }

}
