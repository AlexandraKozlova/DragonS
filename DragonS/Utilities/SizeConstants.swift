//
//  SizeConstants.swift
//  DragonS
//
//  Created by Aleksandra on 09.05.2022.
//

import UIKit

struct SizeConstants {
    static let leftDistanceToView: CGFloat = 30
    static let rightDistanceToView: CGFloat = 30
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - SizeConstants.leftDistanceToView - SizeConstants.rightDistanceToView - (galleryMinimumLineSpacing / 2) / 2)
}
