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
    
    let getUser = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingGradientColor()
    }
//
//    let correctUserName = getUser.login
//    let correctPassword = getUser.password
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else {return}
        guard let viewControllers = tabBarController.viewControllers else {return}
        
        for viewController in viewControllers {
            
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = "\(getUser.person.surname) \(getUser.person.name)"
            }
            
            else if let navigationVC = viewController as? UINavigationController {
                let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
                aboutUserVC.aboutMe = getUser.person.descriptionOfYourself
                aboutUserVC.hading = "\(getUser.person.surname) \(getUser.person.name)"
            }
        }
    }
    
    

    
    
//    guard let tabBarController = segue.destination as? UITabBarController else {return}
//    if let viewControllers = tabBarController.viewControllers {
//
//        for viewController in viewControllers {
//            if let welcomeVC = viewController as? WelcomeViewController {
//                welcomeVC.userName = "\(getUser.person.surname) \(getUser.person.name) "
//        }
//    }
//}
//}

    
    // MARK: - тут вопрос: (не работает скрытие клавиатуры)
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
            showAlert(with: "Invalid login or password", and: "Please, enter correct login and password")
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
        
        present(alert, animated: true)
        
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertAction)
    }
    
   private func settingGradientColor() {
        let color1 = UIColor(red: 251 / 255,
                            green: 214 / 255,
                            blue: 101 / 255,
                            alpha: 1).cgColor
        
        let color2 = UIColor(red: 255 / 255,
                            green: 255 / 255,
                            blue: 255 / 255,
                            alpha: 1).cgColor
        
        let color3 = UIColor(red: 255 / 255,
                            green: 255 / 255,
                            blue: 255 / 255,
                            alpha: 1).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2, color3]

        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}


