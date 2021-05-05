//
//  HeadingView.swift
//  Africa
//
//  Created by Ritwik Jamuar on 05/05/21.
//

import SwiftUI

/**
 Reusable View to show a Header with a Icon Image and Heading Text.
 */
struct HeadingView: View {

    /**
     String denoting the name of the Image found in System Resource.
     */
    var headingImage: String

    /**
     String denoting the Heading Text that we are interested in showing.
     */
    var headingText: String

    var body: some View {

        /**
         Stack the Heading Icon and the Text horizontally.
         */
        HStack {

            // Show the Heading Icon.
            Image(systemName: headingImage)
                .foregroundColor(.accentColor) // Set the Foreground Color of this Image to match that of Accent Color.
                .imageScale(.large) // Set the scaling of this Icon Image to be Large.

            // Show the Heading Text.
            Text(headingText)
                .font(.title3) // Set the Font.
                .fontWeight(.bold) // Set the Text Style as Bold.

        }

    }

}

struct HeadingView_Previews: PreviewProvider {

    static var previews: some View {

        HeadingView(
            headingImage: "photo.on.rectangle.angled",
            headingText: "Wilderness in Pictures"
        ).previewLayout(.sizeThatFits
        ).padding()

    }

}
