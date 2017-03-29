//
//  ItemCollectionViewCell.swift
//  rolll
//
//  Created by carmen cheng on 2017-03-28.
//  Copyright © 2017 carmen cheng. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    var itemName = ""
    
    func setup(itemImage: String) {
        InventoryManager.getItemImage(item: itemImage) { newImage in
            self.cellImage.image = newImage
            self.itemName = itemImage
        }
    }
}
