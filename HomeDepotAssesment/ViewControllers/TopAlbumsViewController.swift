//
//  ViewController.swift
//  HomeDepotAssesment
//
//  Created by Varshini Thatiparthi on 4/6/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import UIKit

enum RightBarButtonTitleType: String {
    case list = "List"
    case grid = "Grid"
}

class TopAlbumsViewController: UIViewController {
    let tableView = AlbumTableView()
    var viewModal = AlbumViewModal()
    let collectionView = AlbumCollectionView()
    var rightBarButton: UIBarButtonItem?
    var wasSelectedList: Bool = false
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        listGridRightBarButton()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        addTableViewCollectonToSuperView()
        title = viewModal.setTitle()
        self.collectionView.isHidden = true
    }
    
    private func addTableViewCollectonToSuperView() {
        self.view.addSubview(tableView)
        tableView.addConstaintsToSuperview()
        
        self.view.addSubview(collectionView)
        collectionView.addConstaintsToSuperview()
    }
    
    func listGridRightBarButton() {
        rightBarButton = UIBarButtonItem(title: RightBarButtonTitleType.grid.rawValue, style: .plain, target: self, action: #selector(selectedListGrid))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func selectedListGrid() {
        wasSelectedList ? hideCollectionViewAndReloadTableView() : hideTableViewAndReloadCollectionView()
    }
    
    func hideCollectionViewAndReloadTableView() {
        rightBarButton?.title = RightBarButtonTitleType.grid.rawValue
        self.tableView.isHidden = false
        self.collectionView.isHidden = true
        wasSelectedList = false
        self.tableView.reloadData()
    }
    
    func hideTableViewAndReloadCollectionView() {
        rightBarButton?.title = RightBarButtonTitleType.list.rawValue
        self.tableView.isHidden = true
        self.collectionView.isHidden = false
        wasSelectedList = true
        self.collectionView.reloadData()
    }
    
    func loadData() {
        viewModal.handleTopAlbumsAPI { [weak self] (results) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.updateResults(results)
            }
        }
    }
    
    func updateResults(_ results: [AlbumResults]) {
        self.tableView.results = results
        self.collectionView.results = results
        self.viewModal.results = results
    }
}


