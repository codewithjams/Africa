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

    var body: some View {

        NavigationView {

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

                    NavigationLink(destination: AnimalDetailView(animal: animal)) {

                        // Populate the individual 'AnimalListItemView' in the 'List'.
                        AnimalListItemView(animal: animal)

                    }

                }

            }

            // Set the Title of the NavigationView used.
            .navigationBarTitle("Africa", displayMode: .large)

        }

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
