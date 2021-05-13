//
//  CentreModifier.swift
//  Africa
//
//  Created by Ritwik Jamuar on 13/05/21.
//

import SwiftUI

/**
 `ViewModifier` for aligning the items in the centre horizontally.
 */
struct CentreModifier: ViewModifier {

    func body(content: Content) -> some View {
        HStack { // Stack the contents Horizontally.
            Spacer() // Add Space on Left.
            content // Put the content between two spacer so that this content takes the centre stage.
            Spacer() // Add Space on Right.
        }
    }

}
