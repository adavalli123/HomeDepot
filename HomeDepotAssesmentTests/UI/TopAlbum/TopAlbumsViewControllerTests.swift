//
//  TopAlbumsViewControllerTests.swift
//  HomeDepotAssesment
//
//  Created by Varshini Thatiparthi on 4/6/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import XCTest
@testable import HomeDepotAssesment

class TopAlbumsViewControllerTests: XCTestCase {
    func testLoadViewSetup() {
        let vc = TopAlbumsViewController()
        vc.setupUI()
        
        XCTAssertEqual(vc.title, "Top Albums")
    }
    
    func testRightBarButton() {
        let vc = TopAlbumsViewController()
        vc.listGridRightBarButton()
        
        XCTAssertEqual(vc.rightBarButton?.title, "Grid")
        XCTAssertEqual(vc.navigationItem.rightBarButtonItem?.title, "Grid")
    }
    
    func testGridViewIsHidden_ListWasPresented() {
        let vc = TopAlbumsViewController()
        vc.listGridRightBarButton()
        vc.hideCollectionViewAndReloadTableView()
        
        XCTAssertEqual(vc.rightBarButton?.title, "Grid")
        XCTAssertTrue(vc.collectionView.isHidden)
        XCTAssertFalse(vc.tableView.isHidden)
    }
    
    func testListViewIsHidden_GridViewWasPresented() {
        let vc = TopAlbumsViewController()
        vc.listGridRightBarButton()
        vc.hideTableViewAndReloadCollectionView()
        
        XCTAssertEqual(vc.rightBarButton?.title, "List")
        XCTAssertTrue(vc.tableView.isHidden)
        XCTAssertFalse(vc.collectionView.isHidden)
    }
    
    func testUpdateResults() {
        let results = AlbumResultBuilder.build()
        let vc = TopAlbumsViewController()
        vc.updateResults(results)
        
        XCTAssertTrue((vc.viewModal.results == vc.tableView.results) == (vc.tableView.results == vc.collectionView.results))
    }
}
