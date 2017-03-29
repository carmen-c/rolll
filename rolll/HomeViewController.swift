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
    
    let itemsOwned: [String] = []
    
    
    //MARK: - Views -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    //MARK: - Buttons -
    
    @IBAction func signOutButton(_ sender: Any) {
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    
    
    //MARK: - Functions -

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Collection View -
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsOwned.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemReuseIdentifier, for: indexPath) as! ItemCollectionViewCell
        return cell
    }
    
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth: CGFloat = 300.0
        let cellHeight: CGFloat = 300.0
        return CGSize(width: cellWidth, height: cellHeight)
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
