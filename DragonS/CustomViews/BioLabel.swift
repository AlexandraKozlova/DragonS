//
//  BioLabel.swift
//  DragonS
//
//  Created by Aleksandra on 08.05.2022.
//

import UIKit

class BioLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .black
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
        numberOfLines = 0
        minimumScaleFactor = 0.75
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
