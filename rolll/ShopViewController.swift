//
//  ShopViewController.swift
//  rolll
//
//  Created by carmen cheng on 2017-03-27.
//  Copyright © 2017 carmen cheng. All rights reserved.
//

import UIKit

let allItems = itemDatabase.all

class ShopViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    //MARK: - Properties -
    
    @IBOutlet weak var shopCollectionView: UICollectionView!
    
    var itemImagesArray:[UIImage] = []
    
    //MARK: - View -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shopCollectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: "shopItem")
        shopCollectionView.delegate = self
        shopCollectionView.dataSource = self
        
        self.getItems()
    }

    
    //MARK: - Functions -
    
    func getItems() {
        InventoryManager.getItemImage(items: allItems) { imagesArray in
            self.itemImagesArray = imagesArray
            print(self.itemImagesArray.count)
        }
        self.shopCollectionView.reloadData()
    }
    
    
    //MARK: - Collection View -
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemImagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shopItem", for: indexPath) as! ShopCollectionViewCell
        cell.shopItemImage.image = self.itemImagesArray[indexPath.row]
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
