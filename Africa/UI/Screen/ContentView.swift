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
     Constant List of `GridItem` as the layouts for Grid to be shown in Grid View.
     */
    @State private var gridLayout: [GridItem] = [
        GridItem(.flexible())
    ]

    /**
     `Int` as a `State` which observes the change in Grid Columns, so that UI will be updated with proper Grid Layout on UI reconstruction.
     */
    @State private var gridColumn: Int = 1

    /**
     `String` as a `State` which observes the change in the Toolbar Icon and update the UI with currently set Icon.
     */
    @State private var toolbarIcon: String = "square.grid.2x2"

    /**
     `Bool` as a `State` which observes whether Grid View is selected by the user or not.
     */
    @State private var isGridViewActive: Bool = false

    /**
     Performs the Grid Switch with following actions performed:
     - Changes the size of `gridLayout` based on this Logic: `gridLayout.count % 3 + 1`
     - Updates the `gridColumn` according to the `gridLayout`.
     - Updates the `toolbarIcon` based on no. of `gridColumn`.
     */
    private func gridSwitch() {

        // Change the Grid Layout.
        gridLayout = Array(
            repeating: .init(.flexible()),
            count: gridLayout.count % 3 + 1
        )

        // Update the Grid Column count.
        gridColumn = gridLayout.count

        // Based on the Grid Columns, set the Toolbar Icon.
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }

    }

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

                    // Make the Grid View scrollable in nature so that this view scrolls for smaller devices.
                    ScrollView(.vertical, showsIndicators: false) {

                        // Populate all the 'animals' under LazyGrid so that all Animals can be seen in Grid View.
                        LazyVGrid(
                            columns: gridLayout,
                            alignment: .center,
                            spacing: 10
                        ) {

                            // Iterate over every 'animals'.
                            ForEach(animals) { animal in

                                // Add a Navigation Link so that on the click of an animal, user is redirected to AnimalDetailView.
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {

                                    // Show AnimalGridItemView to show the Image of the animal.
                                    AnimalGridItemView(animal: animal)

                                }

                            }

                        }.padding(
                            10 // Set Padding to this Grid View as 10.
                        ).animation(
                            .easeIn // Add animation to this Grid View for Ease-In effect.
                        )

                    }

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
                            gridSwitch()
                        }) {

                            // Show an Icon as Square Grid for denoting the Group View.
                            Image(
                                systemName: toolbarIcon
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
