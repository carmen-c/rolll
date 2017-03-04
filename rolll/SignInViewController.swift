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
    var statusAlert: UIAlertController?
    
    //MARK: - View -

    override func viewDidLoad() {
        super.viewDidLoad()
        FIRAuth.auth()!.addStateDidChangeListener() { auth, user in
            if user != nil {
                self.performSegue(withIdentifier: loginSegue, sender: nil)
            }
        }
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
    
    @IBAction func forgotPass(_ sender: Any) {
        showForgotAlert()
    }
    
    @IBAction func tap(_ sender: Any) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }


    
    
    //MARK: - Functions -
        
    func login (email: String, pass: String) {
        Auth.login(email: email, pass: pass, completion: { (error) in
            
            if error != nil {
                self.showError(errorMsg: error?.localizedDescription)
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
                self.showError(errorMsg: error?.localizedDescription)
            }
            else{
                self.isFirstLogin = true
                self.login(email: email, pass: pass)
            }
        })
    }
      
    func showForgotAlert() {
        let forgotPass = UIAlertController(title: "Forgot Password", message: "enter your email", preferredStyle: .alert)
        
        forgotPass.addTextField { (textfield) in
            textfield.text = ""
        }
        
        forgotPass.addAction(UIAlertAction(title: "Cancel", style: .default))
        forgotPass.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (action) -> Void in
            let textfield = forgotPass.textFields![0] as UITextField
            Auth.forgotPassword(email: textfield.text ?? "", completion: { (error) in
                
                if error != nil{
                    self.showError(errorMsg: error?.localizedDescription)
                }
                else{
                    
                }
            })
        }))
        
        self.present(forgotPass, animated: true, completion: nil)
    }
    
    func showError(errorMsg: String?) {
        let unwrapError = errorMsg ?? "Unknown error"
        let errorMsgAlert = UIAlertController(title: "Oops!", message: "\(unwrapError)", preferredStyle: .alert)
        
        errorMsgAlert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        self.present(errorMsgAlert, animated: true, completion: nil)
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
