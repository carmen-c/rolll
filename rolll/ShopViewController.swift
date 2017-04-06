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
    
    func setUp() {
        let userPoints = User.sharedInstance.points
        pointsLabel.text = "\(userPoints)"
        shopkeeperGreeting.text = "welcome"
//        shopkeeperImage.image = UIImage(named: <#T##String#>)
      
    }
    
    
    //MARK: - Collection View -
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
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
                
            } else {
                print("dont have enough points")
            }
        }))
        shopAlert.addAction(UIAlertAction(title: "cancel", style: .default))
        
        self.present(shopAlert, animated: true, completion: nil)
    }

    
}
