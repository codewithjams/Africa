//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Ritwik Jamuar on 08/05/21.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

/**
 Plays a video by instantiating the `videoPlayer` and playing it.
 
 - Parameter fileName: `String` denoting the name of the Video File to play.
 - Parameter format: `String` denoting the format of the Video `fileName`.
 - Returns: Instance of `videoPlayer` which is playing the Video of given `fileName`.
 */
func playVideo(fileName: String, format: String) -> AVPlayer {

    // Create a URL from the
    let url = Bundle.main.url(forResource: fileName, withExtension: format)

    // Check whether the URL is instantiated or not.
    if url != nil {

        // At this point the URL is instantiated, and thus this 'url' can be levereged.

        // Instantiate the VideoPlayer with the 'url'.
        videoPlayer = AVPlayer(url: url!)

        // Play the Video.
        videoPlayer?.play()

    }

    // Return the 'videoPlayer'.
    return videoPlayer!

}
