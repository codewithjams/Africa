//
//  ContentView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 04/05/21.
//

import SwiftUI

/**
 View as a screen to show the Contents of Home Screen.
 */
struct ContentView: View {

    /**
     Collection of Animals fetched by Decoding the JSON File containing all information about the Animals.
     */
    let animals: [Animal] = Bundle.main.decodeJSON(file: "animals.json")

    /**
     Constant as a value for providing Haptic Impact to the user on button's click.
     */
    let haptics = UIImpactFeedbackGenerator(style: .medium)

    /**
     `Bool` as a `State` which observes whether Grid View is selected by the user or not.
     */
    @State private var isGridViewActive: Bool = false

    var body: some View {

        NavigationView {

            Group {

                // Check whether the Grid View is active or not. On the basis of this, UI will be rendered.
                if (!isGridViewActive) {

                    // At this point, the Grid View is not active, which also means the List View is active.
                    // So we render the List View as below.

                    List {

                        // Show the 'CoverImageView' on the Top, so that we can see the Cover Images scrolled through 'TabView'.
                        CoverImageView()
                            .frame(height: 300 // Set the Height of this View as 300.
                            ).listRowInsets(
                                EdgeInsets( // Insert RowInsets to override the default padding applied.
                                    top: 0,
                                    leading: 0,
                                    bottom: 0,
                                    trailing: 0
                                )
                            )

                        // Iterate over every 'animals'.
                        ForEach(animals) { animal in

                            // Add a Navigation Link so that on the click of an animal, user is redirected to AnimalDetailView.
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {

                                // Populate the individual 'AnimalListItemView' in the 'List'.
                                AnimalListItemView(animal: animal)

                            }

                        }

                    }

                } else {
                    
                    // At this point, the Grid View is active, which also means the Grid View is active.
                    // So we render the Grid View as below.

                    // TODO: Change this Placeholder Text to the supposed UI.
                    Text("Grid View")

                }

            }

            // Set the Title of the NavigationView used.
            .navigationBarTitle("Africa", displayMode: .large)

            .toolbar { // Set the Item for Toolbar.

                // Wrap all of the items under ToolbarItem.
                ToolbarItem(placement: .navigationBarTrailing) {

                    // Stack these two buttons horizontally.
                    HStack(spacing: 16) {

                        // Show a Button for toggling the view to List View.
                        Button(action: {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }) {

                            // Show an Icon as List for denoting the List View.
                            Image(
                                systemName: "square.fill.text.grid.1x2"
                            ).font(
                                .title2 // Set the font for this Image as Title2.
                            ).foregroundColor(
                                isGridViewActive ? .primary : .accentColor // Set the Foreground Color based on 'isGridViewActive'.
                            )

                        }

                        // Show a Button for toggling the view to Group View.
                        Button(action: {
                            isGridViewActive = true
                            haptics.impactOccurred()
                        }) {

                            // Show an Icon as Square Grid for denoting the Group View.
                            Image(
                                systemName: "square.grid.2x2"
                            ).font(
                                .title2 // Set the font for this Image as Title2.
                            ).foregroundColor(
                                isGridViewActive ? .accentColor : .primary // Set the Foreground Color based on 'isGridViewActive'.
                            )

                        }

                    }

                }

            }

        }

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
