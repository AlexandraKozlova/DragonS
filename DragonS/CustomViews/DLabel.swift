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
    
    convenience init(fontName: String, fontSize: CGFloat, textAlignment: NSTextAlignment ) {
        self.init(frame: .zero)
        font = UIFont(name: fontName, size: fontSize)
        self.textAlignment = textAlignment
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingHead
    }
    
    
    
}
