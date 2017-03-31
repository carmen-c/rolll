//
//  StoryViewController.swift
//  
//
//  Created by carmen cheng on 2017-03-30.
//
//

import UIKit

class StoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        User.sharedInstance.addPoints(earned: 5000)
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
