//
//  InventoryManager.swift
//  rolll
//
//  Created by carmen cheng on 2017-03-24.
//  Copyright © 2017 carmen cheng. All rights reserved.
//

import UIKit
import Firebase


class InventoryManager: NSObject {
    
    class func getItemImage(item: String, completion: @escaping (_ image: UIImage) -> ()) {
        
        let itemRef = "gacha1/\(item)"
        let reference = FIRStorage.storage().reference(withPath: itemRef)

        reference.data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let image = UIImage(data: data!)
                completion(image!)
            }
        }
        
    }
}
