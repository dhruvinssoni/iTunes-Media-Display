//
//  DataStore.swift
//  iTunes Media
//
//  Created by Dhruvin Soni on 6/21/19.
//  Copyright © 2019 Dhruvin Soni. All rights reserved.
//

import Foundation
import UIKit

final class DataStore {
    static let sharedInstance = DataStore()
    fileprivate init() {}
    
    var applemusic: [iTunesMusic] = []
    var images: [UIImage] = []
    
    func getMusic(completion: @escaping () -> Void) {
        
        APIClient.getiTunesMediaAPI { (json) in
            let feed = json?["feed"] as? iTunesMediaJSON
            if let results = feed?["results"] as? [iTunesMediaJSON] {
                for dict in results {
                    let newAppleMusic = iTunesMusic(dictionary: dict)
                    self.applemusic.append(newAppleMusic)
                }
                completion()
            }
        }
    }
    
    func getartWorkImages(completion: @escaping () -> Void) {
        getMusic {
            for music in self.applemusic { 
                let url = URL(string: music.coverImage)
                let data = try? Data(contentsOf: url!)
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    self.images.append(image!)
                }
            }
            OperationQueue.main.addOperation {
                completion()
            }
        }
    }

}
