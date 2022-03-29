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
    
    @IBOutlet var sliderColor: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        userName.layer.cornerRadius = userName.frame.height/2
        password.layer.cornerRadius = password.frame.height/2
        
        // - MARK: Settings gradient color
        let sliderValueInt = CGFloat(sliderColor.value)
        settingGradientColor(sliderValueInt: sliderValueInt)
        

        
        
        
        // - MARK: Settings slider color
//        let sliderValueInt = sliderColor.value
       
        
    }
    
    @IBAction func forgotUserName() {
        showAlert(with: "Forgot user name?", and: "Your name is Sergey")
    }
    
    @IBAction func forgotPassword() {
        showAlert(with: "Forgot password?", and: "Your password is 123")
    }
    
    
    @IBAction func pressedButtonlogIn() {
        
    }
    
    
    @IBAction func sliderAction() {
        let sliderValueInt = CGFloat(sliderColor.value)
        settingGradientColor(sliderValueInt: sliderValueInt)
    }
    
    
}

extension LoginViewController {
    func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert, animated: true)
        let alertAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(alertAction)
    
    }
    
    func settingGradientColor(sliderValueInt: CGFloat) {
        let color1 = UIColor(red: sliderValueInt / 255, green: 214 / 255, blue: 101 / 255, alpha: 1).cgColor
        let color2 = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1).cgColor
        let color3 = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2, color3]

        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
 
    
}


