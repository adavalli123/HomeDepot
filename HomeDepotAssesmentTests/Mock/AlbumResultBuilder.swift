//
//  AlbumResultBuilder.swift
//  HomeDepotAssesment
//
//  Created by Varshini Thatiparthi on 4/6/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import Foundation
@testable import HomeDepotAssesment

struct AlbumResultBuilder {
    static func build() -> [AlbumResults] {
        return [
            AlbumResults(name: "Slum Dog Millionarie",
                         artistName: "AR Rahman",
                         artworkUrl100: "www.google.com",
                         releaseDate: "Mon 26 2020"),
            AlbumResults(name: "Roja",
                         artistName: "Andre",
                         artworkUrl100: "www.andre.com",
                         releaseDate: "Apr 26 2020")
        ]
    }
}
