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
    var posts: Int?
    var points: Int?
    var sentPets: Int?
    var collection: [String]?
    
    static let sharedInstance = User()
    
    
    //MARK: - Functions -
    
    func toDictionary() -> [String: Any?]{
        var result : [String:Any?] = [:]
        result["uid"] = uid
        result["email"] = email
        result["username"] = username
        result["about"] = about
        result["posts"] = posts
        result["points"] = points
        result["sentPets"] = sentPets
        result["collection"] = collection
        
        return result
    }
    
    func saveToDatabase (completion: @escaping () -> ()) {
        let currentUserRef = userRef.child(self.uid!)
        currentUserRef.setValue(self.toDictionary()) { error, ref in
            completion()
        }
    }
    
    func setupUser(completion: @escaping () -> ()) {
        userRef.child(self.uid!).observe(.value, with: { snapshot in
            
            let snapshotValue = snapshot.value as! [String: Any?]
            self.username = snapshotValue["username"] as? String
            self.about = snapshotValue["about"] as? String
            self.posts = snapshotValue["posts"] as? Int
            self.points = snapshotValue["points"] as? Int
            self.sentPets = snapshotValue["sentPets"] as? Int
            self.collection = snapshotValue["collection"] as? [String]
            
            completion()
        })
    }
    
}
