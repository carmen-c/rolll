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
    var posts: [String]?
    var points: Int?
    var stamina = 100
    
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
            self.username = snapshotValue["username"] as? String
            self.about = snapshotValue["about"] as? String
            self.posts = snapshotValue["posts"] as? [String]
            self.points = snapshotValue["points"] as? Int
            
            completion()
        })
    }
    
    class func staminaCounter() {
        let timer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(addStamina), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func addStamina() {
        if stamina < 100 {
            stamina += 1
        } else {
            stamina += 0
        }
    }
    
//    func removeStamina() {
//        if stamina < 10 {
//            print("dont have enuff")
//        } else {
//            stamina -= 10
//        }
//    }
    
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
