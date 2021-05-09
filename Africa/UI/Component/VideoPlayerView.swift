//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 08/05/21.
//

import SwiftUI
import AVKit

/**
 Reusable `View` to render the `VideoPlayer`.
 */
struct VideoPlayerView: View {

    /**
     Constant `String` as the Video File Name found in the `Video` Group.
     */
    let selectedVideo: String

    /**
     Constant `String` as the Title of the Video.
     */
    let videoTitle: String

    /**
     Initializes a new `VideoPlayerView` with provided parts.
     
     - Parameter selectedVideo: `String` as the Video File Name found in the `Video` Group.
     - Parameter videoTitle: `String` as the Title of the Video.
     */
    init(selectedVideo: String, videoTitle: String) {
        self.selectedVideo = selectedVideo
        self.videoTitle = videoTitle
    }

    var body: some View {

        // Stack the Video Player vertically.
        VStack {

            // Show the Video Player.
            VideoPlayer(
                player: playVideo( // Feed the AVPlayer from 'VideoPlayerHelper'.
                    fileName: selectedVideo,
                    format: "mp4"
                )
            ).overlay(
                Image("logo") // Show the Logo as an Overlay.
                    .resizable() // Make this Image resizable in nature.
                    .scaledToFit() // Make this Image scaled to Fit.
                    .frame(width: 32, height: 32) // Set the Width and Height of the Image Frame.
                    .padding(.top, 6) // Provide Top Padding as 6.
                    .padding(.horizontal, 8), // Provide Horizontal Padding as 8.
                alignment: .topLeading // Align this Overlay on Top-Left.
            )

        }.accentColor(.accentColor // Set the color of contents of this Vertical Stack as same as the Accent Color.
        ).navigationBarTitle(
            videoTitle, // Set the Title of the Navigation Bar.
            displayMode: .inline // Set the Display Mode of Title of the Navigation Bar.
        )

    }

}

struct VideoPlayerView_Previews: PreviewProvider {

    static var previews: some View {

        NavigationView {
            VideoPlayerView(
                selectedVideo: "lion",
                videoTitle: "lion"
            )
        }

    }

}
