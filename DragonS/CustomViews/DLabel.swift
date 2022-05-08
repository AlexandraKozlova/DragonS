//
//  DLabel.swift
//  DragonS
//
//  Created by Aleksandra on 07.05.2022.
//

import UIKit

class DLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(fontSize: CGFloat, textAlignment: NSTextAlignment, textColor: UIColor) {
        self.init(frame: .zero)
        font = UIFont(name: "Avenir-Heavy", size: fontSize)
        self.textAlignment = textAlignment
        self.textColor = textColor
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingHead
    }
}
