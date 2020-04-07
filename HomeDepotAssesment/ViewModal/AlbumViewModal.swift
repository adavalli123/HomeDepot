//
//  AlbumViewModal.swift
//  HomeDepotAssesment
//
//  Created by Varshini Thatiparthi on 4/6/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import Foundation

struct AlbumViewModal: Response {
    var results: [AlbumResults] = []
    
    func handleTopAlbumsAPI(completion: @escaping (([AlbumResults]) -> Void)) {
        Self.handle(url: Constants.topAlbums, decodingType: TopAlbums.self) { (topAlbums, error) in
            guard let results = topAlbums?.feed.results else { return }
            let sortedResults = results.sorted(by: { (result, nextResult) -> Bool in
                return result.releaseDate > nextResult.releaseDate
            })
            
            completion(sortedResults)
        }
    }
    
    func setTitle() -> String {
        return "Top Albums"
    }
}

private extension AlbumViewModal {
    enum Constants {
        static let topAlbums = "api/v1/us/apple-music/top-albums/all/50/explicit.json"
    }
}
