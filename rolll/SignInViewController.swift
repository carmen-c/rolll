//
//  SignInViewController.swift
//  rolll
//
//  Created by carmen cheng on 2017-02-26.
//  Copyright © 2017 carmen cheng. All rights reserved.
//

import UIKit
import Firebase

let loginSegue = "home"
let newUser = "story"

class SignInViewController: UIViewController {
    
    //MARK: - Properties -
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    var isFirstLogin = false

    
    //MARK: - View -

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - Buttons -
    
    @IBAction func loginButton(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        login(email: email, pass: password)
        
    }

    @IBAction func signupButton(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        signup(email: email, pass: password)
    }
    
    
    //MARK: - Functions -
        
    func login (email: String, pass: String) {
        Auth.login(email: email, pass: pass, completion: { (error) in
            
            if error != nil {
                print(error)
            }
            else if self.isFirstLogin == true {
                self.performSegue(withIdentifier: newUser, sender: nil)
            }
            else{
                self.performSegue(withIdentifier: loginSegue, sender: nil)
            }
        })
    }
    
    func signup (email: String, pass: String) {
        Auth.createUser(email: email, pass: pass, completion: { (error) in
            
            if error != nil{
                print(error)
            }
            else{
                self.isFirstLogin = true
                self.login(email: email, pass: pass)
            }
        })
    }
        
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    //MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == loginSegue {
        }
        else if segue.identifier == newUser {
        }
    }
//

}
