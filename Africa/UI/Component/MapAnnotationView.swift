//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 09/05/21.
//

import SwiftUI

/**
 Reusable View to render a Map Pin Location to be rendered in the `MapView`.
 */
struct MapAnnotationView: View {

    /**
     Constant Reference of `Location` denoting the Location Icon we want to render.
     */
    let location: Location

    /**
     Double as a State for storing the value of animation, which is subjected to change by the ongoing animation.
     */
    @State private var animation: Double = 0.0

    /**
     Initializes a `MapAnnotationView` with the given parameters.
     
     - Parameter location: Reference of `Location` encapsulating the Location Icon in it.
     */
    init(location: Location) {
        self.location = location
    }

    var body: some View {

        // Stack all the components on the Z-Axis.
        ZStack {

            // Show a Circle encircling the Image shown.
            Circle()
                .fill(Color.accentColor) // Fill the Color of this Circle as same as the Accent Color.
                .frame( // Set the Frame Size and Alignment of this Circle.
                    width: 54,
                    height: 54,
                    alignment: .center
                )

            // Show a Circle with a Stroke, intended to be animated with Scale Effect and Opacity diminishing as the animation progresses.
            Circle()
                .stroke(
                    Color.accentColor, lineWidth: 2 // Set the Stroke Color of this Circle as same as the Accent Color, with width of size 2.
                ).frame( // Set the Frame Size and Alignment of this Circle.
                    width: 52,
                    height: 52,
                    alignment: .center
                ).scaleEffect( // Set the scaled effect of this Circle based on 'animation'.
                    1 + CGFloat(animation)
                ).opacity( // Set the opacity of this Circle based on 'animation'.
                    1 - animation
                )

            // Show the Icon of the Location Pin as the Image File from 'location'.
            Image(location.image)
                .resizable() // Make this Image resizable in nature.
                .scaledToFit() // Make this Image scaled to fit.
                .frame( // Set the Frame Dimensions of this Image.
                    width: 48,
                    height: 48,
                    alignment: .center
                ).clipShape( // Set the clipping shape in the Image as Circle.
                    Circle()
                )

        }.onAppear { // Listen to callback when this frame is being rendered.

            // Perform change in 'animation'.
            withAnimation(

                // Show the Animation Properties.
                Animation
                    .easeOut(duration: 2) // Set Animation Effect as Ease Out.
                    .repeatForever(autoreverses: false) // Repeat the Animation forever with revering set to false.

            ) {
                animation = 1 // Change the value of animation as 1 when the animation is performed.
            }

        }

    }

}

struct MapAnnotationView_Previews: PreviewProvider {

    /**
     Procure the List of Location from the JSON File statically for preview purpose.
     */
    static let locations: [Location] = Bundle.main.decodeJSON(file: "locations.json")

    static var previews: some View {

        MapAnnotationView(location: locations[2])
            .previewLayout(.sizeThatFits)
            .padding()

    }

}
