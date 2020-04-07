//
//  AlbumTableViewCell.swift
//  HomeDepotAssesment
//
//  Created by Varshini Thatiparthi on 4/6/20.
//  Copyright © 2020 Srikanth Adavalli. All rights reserved.
//

import UIKit

final class AlbumTableViewCell: UITableViewCell {
    var albumImageView = UIImageView()
    var artistLabel = UILabel()
    var albumLabel = UILabel()
    var releaseDateLabel = UILabel()
    
    func configure(url: String, artist: String, album: String, releaseDate: String) {
        self.selectionStyle = .none
        albumImageView = UIImageView.updateAlbumImage(url: url, height: 100, width: 100)
        
        let mainStackView = addStackViewToSuperView()
        let childStackView = UIStackView.configureStackView()
        
        mainStackView.addArrangedSubViews([
            albumImageView,
            childStackView
        ])
        
        albumLabel = UILabel.createLabel(from: album, enableBoldFont: true)
        artistLabel = UILabel.createLabel(from: artist)
        releaseDateLabel = UILabel.createLabel(from: releaseDate)
        
        childStackView.addArrangedSubViews([
            albumLabel,
            artistLabel,
            releaseDateLabel,
            UIView()
        ])
    }
    
    func addStackViewToSuperView() -> UIStackView {
        let mainStackView = UIStackView.configureStackView(spacing: 15, axis: .horizontal)
        addSubview(mainStackView)
        mainStackView.addConstaintsToSuperview(leadingOffset: Constants.Constraints.stackView.leadingOffset,
                                               trailingOffset: Constants.Constraints.stackView.trailingOffset,
                                               topOffset: Constants.Constraints.stackView.topOffset,
                                               bottomOffset: Constants.Constraints.stackView.bottomOffset)
        
        return mainStackView
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        artistLabel.text = nil
        albumLabel.text = nil
        imageView?.image = nil
        releaseDateLabel.text = nil
    }
}

private extension AlbumTableViewCell {
    enum Constants {
        enum Constraints {
            static let stackView = (leadingOffset: CGFloat(15),
                                    trailingOffset: CGFloat(15),
                                    topOffset: CGFloat(15),
                                    bottomOffset: CGFloat(15))
        }
    }
}

