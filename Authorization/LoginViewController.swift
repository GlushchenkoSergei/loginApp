//
//  LoginViewController.swift
//  Authorization
//
//  Created by mac on 28.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBOutlet var buttonlogIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        userName.layer.cornerRadius = userName.frame.height/2
        password.layer.cornerRadius = password.frame.height/2
        buttonlogIn.isEnabled = true
//        buttonlogIn.setTitle("something", for: .disabled)
//        let settingsButton = UIControl.State.disable
        
    }
    
    @IBAction func forgotUserName() {
        showAlert(with: "Forgot user name?", and: "Your name is Sergey")
    }
    
    @IBAction func forgotPassword() {
        showAlert(with: "Forgot password?", and: "Your password is 123")
    }
    
    
    @IBAction func pressedButtonlogIn() {
        
    }
    

    
}

extension LoginViewController {
    func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert, animated: true)
        let alertAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(alertAction)
    }
}
