//
//  GalleryCell.swift
//  DragonS
//
//  Created by Aleksandra on 09.05.2022.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    
    static let reuseID = "GalleryCell"
    
    let imageDragon = DragonImage(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(imageDragon)
        imageDragon.pinToEdges(of: self)
    }
}
