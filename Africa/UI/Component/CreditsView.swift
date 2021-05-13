//
//  CreditsView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 13/05/21.
//

import SwiftUI

/**
 Reusable View Component to show the people and organization involved in developing this application.
 */
struct CreditsView: View {

    var body: some View {

        // Stack all the contents vertically.
        VStack {

            // Show the image of Logo.
            Image(
                "compass"
            ).resizable( // Make this image resizable in nature.
            ).scaledToFit( // Make this image scaled to fit.
            ).frame( // Set the Width and Height of this image.
                width: 128,
                height: 128,
                alignment: .center
            )

            // Put the contents of Developer Name and Link in a Group Box.
            GroupBox {

                // Stack the Image and the Link Horizontally.
                HStack {

                    // Show the Image as an icon for Developer.
                    Image(
                        systemName: "person.circle.fill"
                    ).resizable( // Make this image resizable in nature.
                    ).scaledToFit( // Make this image scaled to fit.
                    ).frame( // Set the Width and Height of this image.
                        width: 24,
                        height: 24,
                        alignment: .center
                    )

                    // Added a Link for my GitHub  Profile.
                    Link(
                        "Ritwik Jamuar", // Set the Name of the Link.
                        destination: URL(string: "https://github.com/ritwikjamuar")! // Set the URL of this Link.
                    ).foregroundColor(.primary) // Set the color of this link as Primary Color for maintaining consistency.

                }
                
            }

        }.padding( // Add some padding to this Vertical Stack.
        ).opacity(
            0.4 // Set the opacity of its contents as 40%.
        )

    }

}

struct CreditsView_Previews: PreviewProvider {

    static var previews: some View {

        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()

    }

}
