//
//  ShopViewController.swift
//  rolll
//
//  Created by carmen cheng on 2017-03-30.
//  Copyright © 2017 carmen cheng. All rights reserved.
//

import UIKit

private let reuseIdentifier = "shopItem"

class ShopViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: - Properties -

    @IBOutlet weak var shopkeeperImage: UIImageView!
    
    @IBOutlet weak var shopkeeperGreeting: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var shopCollectionView: UICollectionView!
    
    
    let allItems = ItemDatabase.all
    
    // MARK: - View -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    //MARK: - Functions -
    
    func setUp() {
//        shopkeeperImage.image = UIImage(named: <#T##String#>)
        updatePoints()
        callShopkeeper()
    }
    
    func callShopkeeper() {
//        shopkeeperImage.image = UIImage(named: <#T##String#>)
        shopkeeperGreeting.text = Shopkeeper.newGreeting()
    }
    
    func updatePoints() {
        if let userPoints = User.sharedInstance.points {
            pointsLabel.text = "points: \(userPoints)"
        } else {
        }
        pointsLabel.setNeedsDisplay()
    }
    
    
    //MARK: - Collection View -
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShopCollectionViewCell
        cell.setup(itemImage: allItems[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = self.shopCollectionView.cellForItem(at: indexPath) as! ShopCollectionViewCell
        let selectedItem = selectedCell.itemName
        let shopAlert = UIAlertController(title: "1000 points", message: "buy this?", preferredStyle: .alert)
        
        shopAlert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) -> Void in
            
            if User.sharedInstance.points! >= 1000 {
                User.sharedInstance.removePoints(used: 1000)
                User.sharedInstance.addItem(item: selectedItem)
                self.updatePoints()
                
            } else {
                let shopAlert2 = UIAlertController(title: "You don't have enough points", message: "go earn more points!", preferredStyle: .alert)
                shopAlert2.addAction(UIAlertAction(title: "ok", style: .default))
                self.present(shopAlert2, animated: false, completion: nil)
            }
        }))
        shopAlert.addAction(UIAlertAction(title: "cancel", style: .default))
        
        self.present(shopAlert, animated: true, completion: nil)
    }

    
}
