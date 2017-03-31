//
//  Router.swift
//  rolll
//
//  Created by carmen cheng on 2017-03-28.
//  Copyright © 2017 carmen cheng. All rights reserved.
//

import UIKit
import Foundation

class Router: NSObject {
    
    //MARK: - Properties -
    var vc: UIViewController?
    
    //MARK: - Object Life Cycle -
    convenience init (_ vc: UIViewController) {
        self.init()
        self.vc = vc
    }
    
    //MARK: - Public Functions -
    func showHome() {
        vc?.show(Router.homeVC(), sender: vc)
    }
    
    func showShop() {
        vc?.show(Router.shopVC(), sender: vc)
    }
    
    func showSignIn() {
        vc?.show(Router.signInVC(), sender: vc)
    }
    
    func showGame() {
        vc?.show(Router.gameVC(), sender: vc)
    }
    
    
    //MARK: - VCs -
    fileprivate class func homeVC() -> HomeViewController {
        return home().instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    }
    
    fileprivate class func shopVC() -> ShopViewController {
        return shop().instantiateViewController(withIdentifier: "ShopViewController") as! ShopViewController
    }
    
    fileprivate class func signInVC() -> SignInViewController {
        return signIn().instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
    }
    
    fileprivate class func gameVC() -> GameViewController {
        return game().instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
    }
    
    
    //MARK: - Storyboard -
    fileprivate class func home() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    fileprivate class func shop() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    fileprivate class func signIn() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
//    fileprivate class func story() -> UIStoryboard {
//        return UIStoryboard(name: "Main", bundle: nil)
//    }
    
    fileprivate class func game() -> UIStoryboard {
        return UIStoryboard(name: "Game", bundle: nil)
    }
    
}
