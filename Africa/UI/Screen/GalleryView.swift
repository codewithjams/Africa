//
//  GalleryView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 04/05/21.
//

import SwiftUI

struct GalleryView: View {

    /**
     Fixed List of `Animal` procured from JSON File to show the images of all Animals.
     */
    let animals: [Animal] = Bundle.main.decodeJSON(file: "animals.json")

    /**
     Constant as a value for providing Haptic Impact to the user on button's click.
     */
    let haptic = UIImpactFeedbackGenerator(style: .medium)

    /**
     `String` denoting the name of Image found in Assets.xcassets as a  `State` which is subjected to change through User Interaction.
     */
    @State var selectedAnimal: String = "lion"

    /**
     List of `GridItem` as a `State`, which is responsible for aligining items in a Grid.
     */
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]

    /**
     `Double` as a `State`, which holds the value of Slider being subjected to change through User Input.
     */
    @State private var gridColumn: Double = 3.0

    /**
     Alters the value of `gridLayout` which is based on the value of `gridColumn`.
     */
    private func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }

    var body: some View {

        // Wrap the contents under Scroll View.
        ScrollView(.vertical) {

            // Stack all of the views vertically.
            VStack(alignment: .center, spacing: 30) {

                // Show a Image of the Animal Selected by the user.
                Image(selectedAnimal)
                    .resizable() // Make this Image resizable in nature.
                    .scaledToFit() // Make this Image Scaled to Fit.
                    .clipShape(Circle()) // Clip the sides of image in the shape of a Circle.
                    .overlay(
                        Circle() // Add a overlay of Circle to show a Circular Border.
                            .stroke(
                                Color.white, // Set the color of Border as white.
                                lineWidth: 5 // Set the width of Border as 5.
                            )
                    )

                // Show a Slider which will change the no. of Columns displayed in LazyGrid by using `gridColumn`.
                Slider(
                    value: $gridColumn, // Show number of grids as `gridColumn`
                    in: 2...4 // Place the Minimum and Maximum range of Slider as 2 to 4.
                ).padding(.horizontal // Add Horizontal Padding.
                ).onChange(of: gridColumn) { value in // Intercept changed in Slider movement by user to intercept a particular value.
                    gridSwitch() // On any interception, just change the value of `gridLayout` accompanied by the method `gridSwitch()`.
                }

                // Render the Animals under LazyGrid so that all the animals are aligned in Grid Manner.
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {

                    // Iterate over different animals.
                    ForEach(animals) { animal in

                        // Show an Image of an individual 'animal',
                        Image(animal.image)
                            .resizable( // Make this Image resizable in nature.
                            ).scaledToFit( // Make this Image Scaled to Fit.
                            ).clipShape(
                                Circle() // Clip the sides of image in the shape of a Circle.
                            ).overlay(
                                Circle() // Add a overlay of Circle to show a Circular Border.
                                    .stroke(
                                        Color.white, // Set the color of Border as white.
                                        lineWidth: 2 // Set the width of Border as 2.
                                    )
                            ).onTapGesture { // Intercept the click of this Image.
                                selectedAnimal = animal.image // Change the Selected Animal Image, which will trigger an update in the whole of UI.
                                haptic.impactOccurred() // Trigger Haptic Feedback to user.
                            }

                    }

                }.animation(.easeIn // Animate the changes of layout in this LazyGrid.
                ).onAppear { // Intercept the callback when this LazyGrid is visible to the User.
                    gridSwitch() // Trigger to perform change in the Grid System under LazyGrid.
                }

            }.padding(
                .horizontal, // Add Horizontal Padding.
                10 // Set Padding Value as 10.
            ).padding(
                .vertical, // Add Vertical Padding.
                50 // Set Padding Value as 50
            )

        }.frame( // Set the frame dimensions of this ScrollView.
            maxWidth: .infinity,
            maxHeight: .infinity
        ).background(
            MotionAnimationView() // Set the background of this ScrollView as 'MotionAnimationView'.
        )

    }

}

struct GalleryView_Previews: PreviewProvider {

    static var previews: some View {
        GalleryView()
    }

}
