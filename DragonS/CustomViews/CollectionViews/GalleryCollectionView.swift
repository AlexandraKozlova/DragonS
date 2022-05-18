//
//  GalleryCollectionView.swift
//  DragonS
//
//  Created by Aleksandra on 09.05.2022.
//

import UIKit

class GalleryCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = SizeConstants.galleryMinimumLineSpacing
        super.init(frame: .zero, collectionViewLayout: layout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        register(GalleryCell.self, forCellWithReuseIdentifier: GalleryCell.reuseID)
        translatesAutoresizingMaskIntoConstraints = false
        contentInset = UIEdgeInsets(top: 0, left: SizeConstants.leftDistanceToView, bottom: 0, right: SizeConstants.rightDistanceToView)
        showsHorizontalScrollIndicator = false
        backgroundColor = .systemGray6
    }
}


