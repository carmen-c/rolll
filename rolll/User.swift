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
    var items: [String]?
    var points: Int?
    
    static let sharedInstance = User()
    
    //MARK: - Functions -
    
    func toDictionary() -> [String: Any?]{
        var result : [String:Any?] = [:]
        result["uid"] = uid
        result["email"] = email
        result["items"] = items
        result["points"] = points
        
        return result
    }
    
    func saveToDatabase(completion: @escaping () -> ()) {
        let currentUserRef = userRef.child(self.uid!)
        currentUserRef.setValue(self.toDictionary()) { error, ref in
            completion()
        }
    }
    
    func setupUser(completion: @escaping () -> ()) {
        userRef.child(self.uid!).observe(.value, with: { snapshot in
            
            let snapshotValue = snapshot.value as! [String: Any?]
            self.items = snapshotValue["items"] as? [String]
            self.points = snapshotValue["points"] as? Int
            
            completion()
        })
    }
    
    func addItem(item: String) {
        self.items?.append(item)
        let currentUser = User.sharedInstance
        let currentUserRef = userRef.child(currentUser.uid!)
        currentUserRef.updateChildValues(["items":self.items!])
    }
    
    
    func addPoints(earned: Int) {
        if points != nil {
            points! += earned
        } else {
            points = earned
        }
        let currentUser = User.sharedInstance
        let currentUserRef = userRef.child(currentUser.uid!)
        currentUserRef.updateChildValues(["points":self.points!])
    }
    
    func removePoints(used: Int) {
        if points! >= used {
            points! -= used
        } else {
            print("not enough points error")
        }
        let currentUser = User.sharedInstance
        let currentUserRef = userRef.child(currentUser.uid!)
        currentUserRef.updateChildValues(["points":self.points!])
    }
    
}
