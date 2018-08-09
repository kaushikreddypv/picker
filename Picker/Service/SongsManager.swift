//
//  SongsManager.swift
//  Picker
//
//  Created by KAUSHIKESWAR REDDY PALLE VENKATA on 8/8/18.
//  Copyright © 2018 KAUSHIKESWAR REDDY PALLE VENKATA. All rights reserved.
//

import Foundation
typealias SongCategory = (title: String, songs: [SongDetail])

final class SongsManager {
    var categoryList = [SongCategory]()
    
    func fetchSongs() {
        categoryList.append(SongCategory(title: "Settling Songs", songs: [SongDetail(title: "I like it"),
        SongDetail(title: "New rules"),
        SongDetail(title: "Saahore baahubali"),
        SongDetail(title: "Break it"),
        SongDetail(title: "No limit"),
        SongDetail(title: "Thinking out loud"),
        SongDetail(title: "In my feelings"),
        SongDetail(title: "jaago re jaago"),
        SongDetail(title: "Ye ishq hai"),
        SongDetail(title: "Dheera dheera")]))
        categoryList.append(SongCategory(title: "Soothing Songs", songs: [SongDetail(title: "Bad bunny"),
        SongDetail(title: "Bodak yellow"),
        SongDetail(title: "Jai Ho"),
        SongDetail(title: "Backstreet boys"),
        SongDetail(title: "Now or never"),
        SongDetail(title: "Thumbs up"),
        SongDetail(title: "Play that song"),
        SongDetail(title: "Into the nightlife"),
        SongDetail(title: "All we need"),
        SongDetail(title: "Into you")]))
    }
}
