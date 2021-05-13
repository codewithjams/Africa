//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 10/05/21.
//

import SwiftUI

/**
 Reusable View to render some circles with animation, moving randomly.
 */
struct MotionAnimationView: View {

    /**
     `Int` as a `State` acting as the count of Circles to be rendered in this `View`.
     */
    @State private var randomCircle: Int = Int.random(in: 12...16)

    /**
     `Bool` as a `State` acting as a flag whether the Animation for this View is started or not.
     */
    @State private var isAnimating: Bool = false

    /**
     Provides the coordinate of the `Circle` under `body` randomly on each invocation.
     
     - Returns: `CGFloat` as the Coordinate Position of the `Circle`.
     */
    private func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }

    /**
     Provides the size of the `Circle` under `body` randomly on each invocation.
     
     - Returns: `CGFloat` as the Size of the `Circle`.
     */
    private func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }

    /**
     Provides the scale of the `Circle` under `body` randomly on each invocation.
     
     - Returns: `CGFloat` as the Scale of the `Circle`.
     */
    private func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }

    /**
     Provides the speed in the Animation of the `Circle` under `body` randomly on each invocation.
     
     - Returns: `Double` as the speed of the Animation.
     */
    private func randomSpeed() -> Double {
        return Double.random(in: 0.25...1.0)
    }

    /**
     Provides the delay in the Animation of the `Circle` under `body` randomly on each invocation.
     
     - Returns: `Double` as the delay to be set while animating the `Circle`.
     */
    private func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }

    var body: some View {

        // Wrap all of the views under 'GeometryReader' so that we can have the information about the display in the device.
        GeometryReader { geometry in

            // Stack all the contents on Z-Axis.
            ZStack {

                // Iterate over the count of 'randomCircle'.
                ForEach(0...randomCircle, id: \.self) { item in

                    // Show a Circle with various attributes.
                    Circle()
                        .foregroundColor(
                            .gray // Set the Foreground Color of this Circle as Gray Color.
                        ).opacity(
                            0.15 // Set the Opacity of this Circle as 15 %.
                        ).frame(
                            width: randomSize(), // Set the width of Circle randomly.
                            height: randomSize(), // Set the height of Circle randomly.
                            alignment: .center
                        ).position(
                            x: randomCoordinate(max: geometry.size.width), // Position the Circle on X-Axis randomly.
                            y: randomCoordinate(max: geometry.size.height) // Position the Circle on Y-Axis randomly.
                        ).scaleEffect(
                            isAnimating ? randomScale() : 1 // Scale the Circle on the basis of 'isAnimating' such that if 'isAnimating' is true then set the scale randomly, otherwise set scale as 1.
                        ).animation(

                            // Add Interpolation Animation to this Circle with various attributes.
                            Animation.interpolatingSpring(
                                stiffness: 0.5,
                                damping: 0.5
                            ).repeatForever( // Make this Animation to repeat forever.
                            ).speed(
                                randomSpeed() // Set the Speed of this Animation randomly.
                            ).delay(
                                randomDelay() // Delay this Animation randomly.
                            )

                        ).onAppear {

                            isAnimating = true // When the whole Z-Stack is visible in the UI, then set isAnimation to true so that Animation can starts.

                        }

                }

            }.drawingGroup( // Render all the components in DrawingGroup so that all the views are flattened in a single View Tree for faster rendering.
            )

        }

    }

}

struct MotionAnimationView_Previews: PreviewProvider {

    static var previews: some View {
        MotionAnimationView()
    }

}
