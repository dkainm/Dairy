//
//  WorkModel.swift
//  Dairy
//
//  Created by Alex Rudoi on 8/9/20.
//  Copyright © 2020 Alex Rudoi. All rights reserved.
//

import Foundation
import RealmSwift

class WorkModel: Object {
    
    @objc dynamic var nameOfClass = ""
    @objc dynamic var homework = ""
    @objc dynamic var deadline = Date()
//
//    init(name: String, homework: String) {
//        self.nameOfClass = name
//        self.homework = homework
//    }
//
//    override required init() {
//        fatalError("init() has not been implemented")
//    }
}
