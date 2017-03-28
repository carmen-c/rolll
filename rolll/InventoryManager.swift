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
    
    class func getItemImage(item: String, completion: @escaping (_ images: UIImage) -> Swift.Void) {
        
        var image = UIImage()
        let url = "\(keyword.cloudkey)"
        let itemRefString = "gacha1/\(item).png"
        let reference = FIRStorage.storage().reference(forURL: url)
        let itemRef = reference.child(itemRefString)

        itemRef.data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
            if (error != nil) {
                print(error?.localizedDescription ?? "error")
            } else {
                if data != nil {
                    image = UIImage(data: data!)!
                    completion(image)
                } else {
                    print ("data is nil")
                }
            }
        }
    }
    
}
