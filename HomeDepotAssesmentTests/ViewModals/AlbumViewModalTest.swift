//
//  AlbumViewModalTest.swift
//  HomeDepotAssesment
//
//  Created by Varshini Thatiparthi on 4/6/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import XCTest
@testable import HomeDepotAssesment

class AlbumViewModalTest: XCTestCase {
    func testTitle() {
        let vm = AlbumViewModal()
        let title = vm.setTitle()
        
        XCTAssertEqual(title, "Top Albums")
    }
    
    
}

