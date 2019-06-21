//
//  MusicList.swift
//  iTunes Media
//
//  Created by Dhruvin Soni on 6/21/19.
//  Copyright © 2019 Dhruvin Soni. All rights reserved.
//

import Foundation

struct iTunesMusic  {
    let album: String
    let artist: String 
    let coverImage: String
    
    init(dictionary: iTunesMediaJSON) {
        self.album = dictionary["name"] as! String
        self.artist = dictionary["artistName"] as! String
        self.coverImage = dictionary["artworkUrl100"] as! String
    }
}
