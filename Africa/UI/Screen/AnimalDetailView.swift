//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 05/05/21.
//

import SwiftUI

/**
 View as a screen to show the Details of an Animal.
 */
struct AnimalDetailView: View {

    /**
     Reference representing the details of the Animal.
     */
    let animal: Animal

    var body: some View {

        // Make all the components of Details scrollable.
        ScrollView(.vertical, showsIndicators: false) {

            // Stack all the components of Details of an Animal vertically.
            VStack(
                alignment: .center,
                spacing: 20
            ) {

                // Show the Animal Image.
                Image(animal.image)
                    .resizable() // Makes this Image resizable in nature.
                    .scaledToFit() // Scale the Image to Fit the area.

                // Show the Name of the Animal.
                Text(animal.name.uppercased())
                    .font(.largeTitle) // Set the Font as Large Title.
                    .fontWeight(.heavy) // Set the Font Weight as Heavy.
                    .multilineTextAlignment(.center) // Align the Text in center.
                    .padding(.vertical, 8) // Add Vertical Padding.
                    .foregroundColor(.primary) // Set the Foreground Color of this Text as same as the Primary Color.
                    .background(
                        Color.accentColor // Adds a line below the text since Color is also a View.
                            .frame(height: 6) // Set the height of the line.
                            .offset(y: 24) // Set the offset position in Y-Axis.
                    )

                // Show the Text for Headline Figures of an Animal.
                Text(animal.headline)
                    .font(.headline) // Set the Font as Headline.
                    .multilineTextAlignment(.leading) // Align the Text from Start.
                    .foregroundColor(.accentColor) // Set the color of this Text as same as the Accent Color.
                    .padding(.horizontal) // Add Horizontal Padding.

                // Group the Header and Images together.
                Group {

                    // Show the Heading.
                    HeadingView(
                        headingImage: "photo.on.rectangle.angled",
                        headingText: "Wilderness in Pictures"
                    ).padding(.horizontal) // Add Horizontal Padding.

                    // Show the List of Gallery Images of an Animal.
                    InsetGalleryView(animal: animal)

                }

                // Group the Header and Facts together.
                Group {

                    // Show the Heading.
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you Know?")

                    // Show the List of Facts of an Animal.
                    InsetFactView(animal: animal)

                }.padding(.horizontal) // Add Horizontal Padding to this Group.

            }

            // Set the Title of this View.
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)

        }

    }

}

struct AnimalDetailView_Previews: PreviewProvider {

    static let animals: [Animal] = Bundle.main.decodeJSON(file: "animals.json")

    static var previews: some View {

        NavigationView {
            AnimalDetailView(animal: animals[5])
        }

    }

}
