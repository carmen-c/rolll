//
//  HomeViewController.swift
//  rolll
//
//  Created by carmen cheng on 2017-03-03.
//  Copyright © 2017 carmen cheng. All rights reserved.
//

import UIKit
import GTProgressBar

class HomeViewController: UIViewController {

    //MARK: - Properties -
    
    
    //MARK: - Views -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        staminaBar()
        
    }
    
    
    //MARK: - Buttons -
    
    
    //MARK: - Functions -
    
    func staminaBar() {
        let progressBar = GTProgressBar(frame: CGRect(x: 20, y: 40, width: 200, height: 20))
        progressBar.progress = 1
        progressBar.barBorderColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
        progressBar.barFillColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
        progressBar.barBackgroundColor = UIColor.white
        progressBar.barBorderWidth = 1
        progressBar.barFillInset = 3
        progressBar.barMaxHeight = 20
        progressBar.displayLabel = false
        
        view.addSubview(progressBar)
    }
    
    func sleep() {
        User.staminaCounter()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
