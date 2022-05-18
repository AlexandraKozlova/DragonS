//
//  WikipediaButton.swift
//  DragonS
//
//  Created by Aleksandra on 08.05.2022.
//

import UIKit

class WikipediaButton: UIButton {
    
    let image = UIImage(systemName: "network")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setTitle("Wikipedia", for: .normal)
        setTitleColor( .white, for: .normal)
        setImage(image, for: .normal)
        tintColor = .white
        
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3.0
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.7
        
        backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
