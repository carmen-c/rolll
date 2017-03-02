//
//  User.swift
//  rolll
//
//  Created by carmen cheng on 2017-03-01.
//  Copyright © 2017 carmen cheng. All rights reserved.
//

import Foundation
import Firebase

let userRef = FIRDatabase.database().reference(withPath: "users")

class User: NSObject {
    
    var uid: String?
    var email: String?
    var username: String?
    var about: String?
    var posts: Int
    var points: Int
    var sentPets: Int
    var collection: [String]?
    
    static let sharedInstance = User()
    
}
