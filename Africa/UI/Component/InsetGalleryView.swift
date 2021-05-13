//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 05/05/21.
//

import SwiftUI

/**
 Reusable View to show Gallery Images of Animals.
 */
struct InsetGalleryView: View {

    /**
     Reference representing the details of the Animal.
     */
    let animal: Animal

    var body: some View {

        // The Images should be scrollable horizontally.
        ScrollView(.horizontal, showsIndicators: false) {

            // Stack Gallery Images horizontally.
            HStack(alignment: .center, spacing: 15) {

                // Iterate over the Gallery Images of the Animal.
                ForEach(animal.gallery, id: \.self) { image in

                    // Show an individual Gallery Image of the Animal.
                    Image(image)
                        .resizable() // Makes this Image resizable in nature.
                        .scaledToFit() // Scale the Image to Fit the area.
                        .frame(height: 200) // Set the Height as 200.
                        .cornerRadius(12) // Add Corners to the Edges of this Image.

                }

            }

        }

    }

}

struct InsetGalleryView_Previews: PreviewProvider {

    /**
     Procure the List of Animals from the JSON File statically for preview purpose.
     */
    static var animals : [Animal] = Bundle.main.decodeJSON(file: "animals.json")

    static var previews: some View {

        InsetGalleryView(animal: animals[5])
            .previewLayout(.sizeThatFits)

    }

}
