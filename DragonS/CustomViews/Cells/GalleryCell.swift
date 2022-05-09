//
//  GalleryCell.swift
//  DragonS
//
//  Created by Aleksandra on 09.05.2022.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    
    static let reuseID = "GalleryCell"
    
    let imageDragon = UIImageView()
    
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
        imageDragon.translatesAutoresizingMaskIntoConstraints = false
        imageDragon.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        imageDragon.contentMode = .scaleAspectFill
        imageDragon.layer.cornerRadius = 50
        imageDragon.clipsToBounds = true
    }
    
}
