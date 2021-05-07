//
//  VideoListView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 04/05/21.
//

import SwiftUI

/**
 View as a screen to show the List of Videos of Animals.
 */
struct VideoListView: View {

    /**
     List of Videos of Animals as a State, as these videos will be shuffled on the Button Click.
     */
    @State var videos: [Video] = Bundle.main.decodeJSON(file: "videos.json")

    /**
     Constant as a value for providing Haptic Impact to the user on button's click.
     */
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    var body: some View {

        // Show all the Items of this screen in the NavigationView.
        NavigationView {

            // Render List of Videos.
            List(videos) { video in

                // Show an individual Video content.
                VideoListItemView(video: video)
                    .padding(.vertical, 8)

            }.listStyle(
                InsetGroupedListStyle() // Set the List style as 'InsetGroupedListStyle'.
            )

            .toolbar {

                // Add a Toolbar Item in the Navigation Toolbar.
                ToolbarItem(placement: .navigationBarTrailing) {

                    // Show Button as the Toolbar Ite,
                    Button(
                        action: { // Set the Action to be performed when the Button is clicked.
                            videos.shuffle() // Trigger to shuffle the 'videos' so that on the change in the 'videos' the UI is re-rendered.
                            hapticImpact.impactOccurred() // Trigger Haptic Impact.
                        }
                    ) {
                        // Show Image as an Icon of this Button.
                        Image(systemName: "arrow.2.squarepath")
                    }

                }

            }

            // Set the Title of this Navigation.
            .navigationBarTitle(
                "Videos", // Set the Title of this Navigation Toolbar as 'Videos'.
                displayMode: .inline // Set the Display Mode as Inline.
            )

        }

    }

}

struct VideoListView_Previews: PreviewProvider {

    static var previews: some View {
        VideoListView()
    }

}
