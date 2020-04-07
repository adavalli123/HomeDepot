//
//  AlbumCollectionView.swift
//  HomeDepotAssesment
//
//  Created by Varshini Thatiparthi on 4/6/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import UIKit

class AlbumCollectionView: UICollectionView {
    var results: [AlbumResults] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        layout.itemSize = CGSize(width: 200, height: 110)
        layout.minimumLineSpacing = 15
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .secondarySystemBackground
        registerCells()
        conformToDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    private func registerCells() {
        self.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: AlbumCollectionViewCell.self))
    }
    
    private func conformToDataSource() {
        self.dataSource = self
        self.delegate = self
    }
}

extension AlbumCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AlbumCollectionViewCell.self), for: indexPath) as? AlbumCollectionViewCell else {
            return AlbumCollectionViewCell()
        }
        
        guard let result = results[exist: indexPath.row] else { return cell }
        cell.configure(url: result.artworkUrl100, artist: result.artistName, album: result.name, releaseDate: result.releaseDate)
        return cell
    }
}
