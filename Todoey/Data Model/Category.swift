//
//  Category.swift
//  Todoey
//
//  Created by Macbook on 04/03/2020.
//  Copyright © 2020 Giulia Catalano. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
    let items = List<Item>()
}

