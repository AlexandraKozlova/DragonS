//
//  DragonsList.swift
//  DragonS
//
//  Created by Aleksandra on 06.05.2022.
//

import Foundation

struct DragonsList: Decodable {
    let flickrImages: [String]
    let name: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case flickrImages = "flickr_images"
        case name
        case id
    }
    
}
