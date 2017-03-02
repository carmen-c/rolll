//
//  Authenticate.swift
//  rolll
//
//  Created by carmen cheng on 2017-03-01.
//  Copyright © 2017 carmen cheng. All rights reserved.
//

import Foundation
import Firebase

class Auth: NSObject {
    
    class func createUser(email: String, pass: String, completion: @escaping (Error?) -> ()) {
        
        FIRAuth.auth()!.createUser(withEmail: email, password: pass) { user, error in
            
            if let error = error {
                completion(error)
                
            }else {
                let currentUser = User.sharedInstance
                currentUser.uid = user?.uid
                currentUser.email = user?.email
                currentUser.saveToDatabase {
                    completion(nil)
                }
            }
        }
    }
    
    class func login(email: String, pass: String, completion: @escaping (Error?) -> ()) {
        
        FIRAuth.auth()!.signIn(withEmail: email, password: pass) { user, error in
            
            if let error = error {
                completion(error)
                
            }else {
                let currentUser = User.sharedInstance
                currentUser.uid = user?.uid
                currentUser.email = user?.email
                currentUser.setupUser {
                    completion(nil)
                }
            }
        }
    }
    
}
