//
//  SignInViewController.swift
//  rolll
//
//  Created by carmen cheng on 2017-02-26.
//  Copyright © 2017 carmen cheng. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    //MARK: - Properties -
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //MARK: - View -

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - Buttons -
    
    @IBAction func loginButton(_ sender: Any) {
        
    }

    
    @IBAction func signupButton(_ sender: Any) {
        
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
