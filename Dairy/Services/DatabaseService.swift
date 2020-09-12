//
//  DatabaseService.swift
//  Dairy
//
//  Created by Alex Rudoi on 9/9/20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import RealmSwift

class DatabaseService {
    
    static var shared = DatabaseService()
    
    func addNewItem(name: String, descriprion: String, deadline: Date?) {
        
        let homework = WorkModel()
        homework.nameOfClass = name
        homework.homework = descriprion
        if let dateTil = deadline {
            homework.deadline = dateTil
        }
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(homework)
        }
    }
    
    func deleteItem(_ item: WorkModel) {
        
        let realm = try! Realm()
        
        try! realm.write() {
            realm.delete(item)
        }
    }
    
    func updateItem(_ item: WorkModel, name: String, descriprion: String, deadline: Date?) {
        
        let realm = try! Realm()
        
        try! realm.write {
            item.nameOfClass = name
            item.homework = descriprion
            if let dline = deadline {
                item.deadline = dline
            }
        }
    }
    
}
