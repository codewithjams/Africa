//
//  CoverImageView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 04/05/21.
//

import SwiftUI

/**
 Reusable View to show a Cover Image.
 */
struct CoverImageView: View {

    /**
     Collection of Cover Images which is to be rendered.
     */
    let coverImages : [CoverImage] = Bundle.main.decodeJSON(file: "covers.json")

    var body: some View {

        // Show all the Cover Images under a Tab which can be scrolled Horizontally.
        TabView {

            // Iterate over every Cover Images.
            ForEach(coverImages) { item in

                // Show a Image.
                Image(item.name)
                    .resizable()
                    .scaledToFill()

            }

        }.tabViewStyle(
            PageTabViewStyle() // Set the Tab View Style to show Dots for different tabs.
        )

    }

}

struct CoverImageView_Previews: PreviewProvider {

    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }

}
