//
//  GalleryView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 04/05/21.
//

import SwiftUI

struct GalleryView: View {

    var body: some View {

        // Wrap the contents under Scroll View.
        ScrollView(.vertical) {

            // Show the Placeholder Text to denote Gallery.
            Text("Gallery")

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
