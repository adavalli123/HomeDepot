//
//  TopAlbums.swift
//  HomeDepotAssesment
//
//  Created by Varshini Thatiparthi on 4/6/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import Foundation

struct TopAlbums: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let results: [AlbumResults]
}

struct AlbumResults: Decodable, Equatable {
    let name: String
    let artistName: String
    let artworkUrl100: String
    let releaseDate: String
}
