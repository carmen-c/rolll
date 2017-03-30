//
//  ShopCollectionViewController.swift
//  
//
//  Created by carmen cheng on 2017-03-28.
//
//

import UIKit

private let reuseIdentifier = "shopItem"

class ShopCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties -
    
    let allItems = itemDatabase.all
    
    // MARK: - View -
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ShopCollectionViewCell
        cell.setup(itemImage: allItems[indexPath.row])
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = self.collectionView?.cellForItem(at: indexPath) as! ShopCollectionViewCell
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
    }
    
    // MARK: - UICollectionViewDelegate -

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */


}
