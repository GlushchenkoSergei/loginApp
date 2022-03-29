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
    
    private let correctUserName = "Eugenya"
    private let correctPassword = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        userName.layer.cornerRadius = userName.frame.height/2
        password.layer.cornerRadius = password.frame.height/2
        
        settingGradientColor()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        welcomeVC.userName = userName.text
    }
    
    // MARK: - тут вопрос: (не работает скрытие клавиатуры)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }

    @IBAction func forgotUserName() {
        showAlert(with: "Oops!", and: "Your name is \(correctUserName) 😉")
    }
    
    @IBAction func forgotPassword() {
        showAlert(with: "Oops!", and: "Your password \(correctPassword)")
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userName.text = ""
        password.text = ""
    }
    
    @IBAction func pressedButtonlogIn() {
        guard userName.text == correctUserName, password.text == correctPassword else {
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


