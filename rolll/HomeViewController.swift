//
//  HomeViewController.swift
//  rolll
//
//  Created by carmen cheng on 2017-03-03.
//  Copyright © 2017 carmen cheng. All rights reserved.
//

import UIKit
import Firebase

private let itemReuseIdentifier = "item"

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    //MARK: - Properties -

    @IBOutlet weak var inventory: UICollectionView!
    
    let itemsOwned: [String] = User.sharedInstance.items ?? []
    
    //MARK: - Views -
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - Buttons -
    
    @IBAction func signOutButton(_ sender: Any) {
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
            Router(self).showSignIn()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    @IBAction func shopButton(_ sender: Any) {
        Router(self).showShop()
    }
    
    @IBAction func playButton(_ sender: Any) {
        Router(self).showGame()
    }
    
    //MARK: - Functions -
    
    
    
    //MARK: - Collection View -
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsOwned.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemReuseIdentifier, for: indexPath) as! ItemCollectionViewCell
        cell.setup(itemImage: itemsOwned[indexPath.row])
        return cell
    }
    
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = 300.0
        let cellHeight: CGFloat = 300.0
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = self.inventory.cellForItem(at: indexPath) as! ItemCollectionViewCell
        let selectedItem = selectedCell.itemName
        
        
    }


}
