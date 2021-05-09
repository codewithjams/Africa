//
//  VideoListItem.swift
//  Africa
//
//  Created by Ritwik Jamuar on 07/05/21.
//

import SwiftUI

/**
 Reusable View to show small details of Video of an Animal.
 */
struct VideoListItemView: View {

    /**
     A video of an Animal.
     */
    let video: Video

    var body: some View {

        // Stack the Cover Image with Play Icon and Animal Name with Headlines horizontally.
        HStack(spacing: 10) {

            // Stack the Cover Image and Play Icon on Z-Axis.
            ZStack {

                // Show an Image as the Video Cover.
                Image(video.thumbnail)
                    .resizable() // Make this Image Resizable.
                    .scaledToFit() // Make this Image Scaled to Fit.
                    .frame(height: 80) // Set Maximum Height of the Image as 32.
                    .cornerRadius(9) // Set Corners of this Image with radius 9.

                // Show an Image as a placeholder to denote the Play  Icon.
                Image(systemName: "play.circle")
                    .resizable() // Make this Image Resizable.
                    .scaledToFit() // Make this Image Scaled to Fit.
                    .frame(height: 32) // Set Maximum Height of the Image as 32.
                    .shadow(radius: 4) // Set the Shadow with radius 4.

            }

            // Stack the Animal Name and Video Headline Vertically.
            VStack(alignment: .leading, spacing: 10) {

                // Show a Text for name of the Animal in the Video.
                Text(video.name)
                    .font(.title2) // Set the Font of this Text as Title2.
                    .fontWeight(.heavy) // Set the Font Weight as Heavy.
                    .foregroundColor(.accentColor) // Set the Foreground Color of this Text as same as Accent Color.

                // Show a Text for Headline of the Video.
                Text(video.headline)
                    .font(.footnote) // Set the Font of this Text as Footnote.
                    .multilineTextAlignment(.leading) // Align the Text from Start.
                    .lineLimit(2) // Set Maximum Lines displayed as 2.

            }

        }

    }

}

struct VideoListItem_Previews: PreviewProvider {

    /**
     Procure the List of Videos from the JSON File statically for preview purpose.
     */
    static let videos: [Video] = Bundle.main.decodeJSON(file: "videos.json")

    static var previews: some View {

        VideoListItemView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()

    }

}
