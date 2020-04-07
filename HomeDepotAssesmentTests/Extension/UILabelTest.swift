//
//  UILabelTest.swift
//  HomeDepotAssesment
//
//  Created by Varshini Thatiparthi on 4/6/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import XCTest
@testable import HomeDepotAssesment

class UILabelTest: XCTestCase {
    func testLabelCreation() {
        let label = UILabel.createLabel(from: "ABC")
        
        XCTAssertEqual(label.text, "ABC")
        XCTAssertEqual(label.numberOfLines, 1)
        XCTAssertEqual(label.font, UIFont.systemFont(ofSize: 13))
        XCTAssertEqual(label.textAlignment, NSTextAlignment.left)
    }
    
    func testLabelCreation_custom() {
        let label = UILabel.createLabel(from: "ABC", enableBoldFont: true, numberOfLines: 0)
        
        XCTAssertEqual(label.text, "ABC")
        XCTAssertEqual(label.numberOfLines, 0)
        XCTAssertEqual(label.font, UIFont.systemFont(ofSize: 13, weight: .heavy))
        XCTAssertEqual(label.textAlignment, NSTextAlignment.left)
    }
}
