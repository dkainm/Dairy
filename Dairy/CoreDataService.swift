//
//  CoreDataService.swift
//  Dairy
//
//  Created by Alex Rudoi on 8/9/20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import Foundation
import RealmSwift

final class CoreDataService {
    
    var realm: Realm!
    
    static let shared = CoreDataService()
    
    init() {
        
        self.realm = try! Realm()
    }
    
    func createNewItem(clas: ClassModel, completion: @escaping EmptyClosure) {
        
    }
    
}
