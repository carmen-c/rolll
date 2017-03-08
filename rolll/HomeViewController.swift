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

    var isSleeping = false
    var stamina:Float = 0.01
    
    //MARK: - Views -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let progressBar = GTProgressBar(frame: CGRect(x: 20, y: 40, width: 200, height: 20))
        progressBar.progress = CGFloat(stamina)
        progressBar.barBorderColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
        progressBar.barFillColor = UIColor(red:0.35, green:0.80, blue:0.36, alpha:1.0)
        progressBar.barBackgroundColor = UIColor.white
        progressBar.barBorderWidth = 1
        progressBar.barFillInset = 3
        progressBar.barMaxHeight = 20
        progressBar.displayLabel = false
        
        view.addSubview(progressBar)
        
//        progressBar.animateTo(progress: userStamina)
        
    }
    
    
    //MARK: - Buttons -
    
    @IBAction func bed(_ sender: Any) {
        if isSleeping == false {
            isSleeping = true
            
        }else if isSleeping == true{
            isSleeping = false
        }
        
        sleep()
        print("bed button pressed")
    }

    @IBAction func laptop(_ sender: Any) {
        print("laptop button pressed")
    }
    
    @IBAction func door(_ sender: Any) {
        print("door button pressed")
    }
    
    
    //MARK: - Functions -
    
    func sleep() {
        let timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(addStamina), userInfo: nil, repeats: true)
        
        if isSleeping == true {
            timer.fire()
        }else {
            timer.invalidate()
        }
    }
    
    func addStamina() {
        let increment:Float = 0.01
        
        if self.stamina < 1 {
            self.stamina += increment
        } else {
            self.stamina += 0
        }
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
