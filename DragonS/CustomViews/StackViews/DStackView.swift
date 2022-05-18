//
//  DStackView.swift
//  DragonS
//
//  Created by Aleksandra on 15.05.2022.
//

import UIKit

class DStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        axis = .vertical
        spacing = 5
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }
}
