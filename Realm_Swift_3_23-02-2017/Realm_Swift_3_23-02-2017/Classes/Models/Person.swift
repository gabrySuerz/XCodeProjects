//
//  Person.swift
//  Realm_Swift_3_23-02-2017
//
//  Created by Gabriele Suerz on 23/02/17.
//  Copyright © 2017 Gabriele Suerz. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class Person: RealmSwift.Object {
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    
    dynamic var id = 0
    dynamic var image = ""
    dynamic var username = ""
    dynamic var name = ""
    dynamic var birth = Date()
    dynamic var address = ""
    dynamic var phone = ""
    dynamic var email = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
