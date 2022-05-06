//
//  DragonsCell.swift
//  DragonS
//
//  Created by Aleksandra on 06.05.2022.
//

import UIKit

class DragonCell: UITableViewCell {
    
    static let reuseID = "DragonCell"
    
    let pictureView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let dragonName = DLabel(fontName: "Avenir-Heavy", fontSize: 25, textAlignment: .left)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(pictureView)
        addSubview(dragonName)
        backgroundColor = .systemGray6
        pictureView.image = UIImage(named: "logo")
        dragonName.text = "Dragon1"
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            pictureView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            pictureView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            pictureView.heightAnchor.constraint(equalToConstant: 95),
            pictureView.widthAnchor.constraint(equalToConstant: 95),
            
            dragonName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dragonName.leadingAnchor.constraint(equalTo: pictureView.trailingAnchor, constant: 24),
            dragonName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            dragonName.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

