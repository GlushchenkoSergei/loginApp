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
    
    private let getUser = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingGradientColor()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController
        else {return}
        guard let viewControllers = tabBarController.viewControllers
        else {return}
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = getUser.person.fullName
            } else if let navigationVC = viewController as? UINavigationController {
                guard let aboutUserVC = navigationVC.topViewController as?
                        AboutMeViewController else {return}
                
                aboutUserVC.aboutMe = getUser.person.descriptionOfYourself
                aboutUserVC.hading = getUser.person.fullName
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func forgotUserName() {
        showAlert(with: "Oops!", and: "Your name is \(getUser.login) 😉")
    }
    
    @IBAction func forgotPassword() {
        showAlert(with: "Oops!", and: "Your password \(getUser.password)")
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userName.text = ""
        password.text = ""
    }
    
    @IBAction func pressedButtonlogIn() {
        guard userName.text == getUser.login, password.text == getUser.password else {
            showAlert(with: "Invalid login or password", and: """
                        Please, enter correct login and password
                        """)
            
            password.text = ""
            return
        }
        performSegue(withIdentifier: "segueWelcomeVC", sender: nil)
    }
    
}

extension LoginViewController {
    
   private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                    message: message,
                                    preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertAction)
       
       present(alert, animated: true)
    }
    
    private func settingGradientColor() {
        let color1 = UIColor(red: 255 / 255,
                            green: 255 / 255,
                            blue: 255 / 255,
                            alpha: 1).cgColor
        
        let color2 = UIColor(red: 40 / 255,
                            green: 185 / 255,
                            blue: 235 / 255,
                            alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2]

        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}


