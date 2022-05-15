//
//  StorageManager.swift
//  DragonS
//
//  Created by Aleksandra on 13.05.2022.
//

import Foundation
import RealmSwift

class StorageManager {
    
    static let shared = StorageManager()
    let realm = try! Realm()
    
    func saveObject(dragonsList: [DragonsList]) {
        let casheDragosList = getCasheList()
        
        for dragon in dragonsList {
            let dragons = DragonsListRealm(name: dragon.name, id: dragon.id)
            
            guard !casheDragosList.contains(where: { element in
                return element.id == dragons.id
            }) else { return }
            try! realm.write { realm.add(dragons)
            }
        }
    }
    
    func getCasheList() -> [DragonsList] {
        let casheList = Array(realm.objects(DragonsListRealm.self))
        var dragonsList = [DragonsList]()
        
        for dragon in casheList {
            let dragon = DragonsList(flickrImages: [""], name: dragon.name, id: dragon.id)
            dragonsList.append(dragon)
        }
        return dragonsList
    }
}
