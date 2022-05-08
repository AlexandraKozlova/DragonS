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
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    let dragonName = DLabel(fontSize: 25, textAlignment: .center, textColor: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))
    
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
        pictureView.layer.cornerRadius = 50
        dragonName.text = "Dragon1"
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            pictureView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            pictureView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pictureView.heightAnchor.constraint(equalToConstant: 300),
            pictureView.widthAnchor.constraint(equalToConstant: 300),
            
            dragonName.topAnchor.constraint(equalTo: pictureView.bottomAnchor, constant: 5),
            dragonName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            dragonName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            dragonName.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}

