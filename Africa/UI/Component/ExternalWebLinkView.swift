//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 06/05/21.
//

import SwiftUI

/**
 Reusable View to render the Link Section of Animal.
 */
struct ExternalWebLinkView: View {

    /**
     Reference representing the details of the Animal.
     */
    let animal: Animal

    var body: some View {

        // Put all the contents in a 'GroupBox'.
        GroupBox {

            // Stack all the components horizontally.
            HStack {

                // Set the Icon for Link as a Globe Icon.
                Image(systemName: "globe")

                // Show a Placeholder Text as 'Wikipedia'.
                Text("Wikipedia")

                // Provide the Space between Placeholder Text and Group of Link.
                Spacer()

                // Group the Link Name and Icon together.
                Group {

                    // Show a Icon for Link URL.
                    Image(systemName: "arrow.up.right.square")

                    // Show a Link that redirects to the Web URL that shows the information of this Animal.
                    Link(
                        animal.name, // Set the name of the Link as the Name of the Animal.
                        destination: URL(string: animal.link) ?? // Set the Link
                            URL(string: "https://wikipedia.org")!
                    )

                }.foregroundColor(.accentColor) // Set the color of this Group as same as the Accent Color.

            }

        }

    }

}

struct ExternalWebLinkView_Previews: PreviewProvider {

    /**
     Procure the List of Animals from the JSON File statically for preview purpose.
     */
    static let animals: [Animal] = Bundle.main.decodeJSON(file: "animals.json")

    static var previews: some View {

        ExternalWebLinkView(animal: animals[6])
            .previewLayout(.sizeThatFits)
            .padding()

    }

}
