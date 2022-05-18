//
//  DragonsListRealm.swift
//  DragonS
//
//  Created by Aleksandra on 13.05.2022.
//

import Foundation
import RealmSwift

class DragonsListRealm: Object {
    @objc dynamic var name = ""
    @objc dynamic var id = ""
    
    convenience init(name: String, id: String) {
        self.init()
        self.name = name
        self.id = id
    }
}
