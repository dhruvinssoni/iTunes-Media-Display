//
//  APIClient.swift
//  iTunes Media
//
//  Created by Dhruvin Soni on 6/21/19.
//  Copyright © 2019 Dhruvin Soni. All rights reserved.
//

import Foundation

typealias iTunesMediaJSON = [String: Any]

struct APIClient {
    
    static func getiTunesMediaAPI(completion: @escaping (iTunesMediaJSON?) -> Void) { 
        
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/100/explicit.json")
        
        let session = URLSession.shared
        
        guard let unwrappedURL = url else { print("Error unwrapping URL"); return }
        
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedDAta = data else { print("Error unwrapping data"); return }
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedDAta, options: []) as? iTunesMediaJSON
                print(responseJSON!)
                completion(responseJSON)
            } catch {
                print("Could not get API data. \(error), \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}
