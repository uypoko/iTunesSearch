//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Ryan on 6/17/19.
//  Copyright © 2019 Caleb Hicks. All rights reserved.
//

import Foundation

struct StoreItem: Codable {
    let name: String
    let artist: String
    let kind: String
    let artworkURL: URL
    
    enum CodingKeys: String, CodingKey {
        case name = "trackName"
        case artist = "artistName"
        case kind = "kind"
        case artworkURL = "artworkUrl100"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: CodingKeys.name)
        artist = try values.decode(String.self, forKey: CodingKeys.artist)
        kind = try values.decode(String.self, forKey:  CodingKeys.kind)
        artworkURL = try values.decode(URL.self, forKey: CodingKeys.artworkURL)
    }
}

struct StoreItems: Codable {
    let results: [StoreItem]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}
