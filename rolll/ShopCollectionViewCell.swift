//
//  ShopCollectionViewCell.swift
//  rolll
//
//  Created by carmen cheng on 2017-03-27.
//  Copyright © 2017 carmen cheng. All rights reserved.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shopItemImage: UIImageView!
    public var itemName = ""
    
    func setup(itemImage: String) {
        InventoryManager.getItemImage(item: itemImage) { newImage in
            self.shopItemImage.image = newImage
            self.itemName = itemImage
        }
    }
}
