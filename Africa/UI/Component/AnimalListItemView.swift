//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 05/05/21.
//

import SwiftUI

/**
 Reusable View to show small details of a Animal.
 */
struct AnimalListItemView: View {

    /**
     An individual Animal.
     */
    let animal : Animal

    var body: some View {

        // Stack Animal Image and Details horizontally.
        HStack(
            alignment: .center,
            spacing: 16
        ) {

            // Show the Image of the Animal.
            Image(animal.image)
                .resizable() // Makes this Image resizable in nature.
                .scaledToFill() // Scale the Image to Fill the area.
                .frame(width: 90, height: 90) // Set the Width and Height of the Image.
                .clipShape(RoundedRectangle(cornerRadius: 12)) // Round the Corners of the Image.

            // Stack Name and Headline vertically.
            VStack(alignment: .leading, spacing: 8) {

                // Show the Name of the Animal.
                Text(animal.name)
                    .font(.title2) // Set the Font.
                    .fontWeight(.heavy) // Set the Font Weight.
                    .foregroundColor(.accentColor) // Set the Color of this Text as same as the Accent Color.

                // Show the Headlines around the Animal.
                Text(animal.headline)
                    .font(.footnote) // Set the Font.
                    .multilineTextAlignment(.leading) // Set the Alignment of this Text as Leading so that Text displayed has Left-to-Right Alignment.
                    .lineLimit(2) // Limit the no. of Lines in Headlines to be displayed as 2.
                    .padding(.trailing, 8) // Provide some padding in the end.

            }

        }

    }

}

struct AnimalListItemView_Previews: PreviewProvider {

    /**
     Procure the List of Animals from the JSON File statically for preview purpose.
     */
    static let animals: [Animal] = Bundle.main.decodeJSON(file: "animals.json")

    static var previews: some View {
        AnimalListItemView(animal: animals[4])
            .previewLayout(.sizeThatFits)
            .padding()
    }

}
