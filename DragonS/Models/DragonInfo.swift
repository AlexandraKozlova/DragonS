//
//  DragonInfo.swift
//  DragonS
//
//  Created by Aleksandra on 08.05.2022.
//

import Foundation

struct DragonInfo: Decodable {
    let flickrImages: [String]
    let name: String
    let wikipedia: String
    let description: String
    let firstFlight: String
    let dryMassKg: Int
    let heightWTrunk: Meters
    
    enum CodingKeys: String, CodingKey {
        case firstFlight = "first_flight"
        case flickrImages = "flickr_images"
        case heightWTrunk = "height_w_trunk"
        case name
        case wikipedia
        case description
        case dryMassKg = "dry_mass_kg"
    }
    
    struct Meters: Decodable {
        var meters: Double
    }
}
