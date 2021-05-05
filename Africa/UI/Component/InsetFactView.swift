//
//  InsetFactView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 05/05/21.
//

import SwiftUI

/**
 Reusable View to render the collection of Facts of Animals.
 */
struct InsetFactView: View {

    /**
     Reference representing the details of the Animal.
     */
    let animal: Animal

    var body: some View {

        // Put the Facts in a Group.
        GroupBox {

            // Show all the Facts under a Tab, which can be scrolled horizontally.
            TabView {

                // Iterate over all the facts of an Animal.
                ForEach(animal.fact, id: \.self) { fact in

                    // Show the Text as a Fact of an Animal.
                    Text(fact)
                        .font(.subheadline) // Set the Font as Sub-Headline.
                        .fontWeight(.medium) // Set the Text Style as Medium.

                }

            }.tabViewStyle(PageTabViewStyle() // Set the Style of the Tab.
            ).frame(minHeight: 148, idealHeight: 168, maxHeight: 180 // Set the Height Dimensions of this Tab.
            )

        }

    }

}

struct InsetFactView_Previews: PreviewProvider {

    static let animals: [Animal] = Bundle.main.decodeJSON(file: "animals.json")

    static var previews: some View {

        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()

    }

}
