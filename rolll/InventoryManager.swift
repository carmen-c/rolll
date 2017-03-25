//
//  InventoryManager.swift
//  rolll
//
//  Created by carmen cheng on 2017-03-24.
//  Copyright © 2017 carmen cheng. All rights reserved.
//

import Foundation
import Firebase

let storage = FIRStorage.storage()
let storageRef = storage.reference()

class InventoryManager: NSObject {
    
    class func getItemImage(item: , completion: @escaping (_ image: UIIMage) -> ()) {
        var fetchedImage = UIImage()
        let imageRef = storageRef.child("images")
        
    }
}
