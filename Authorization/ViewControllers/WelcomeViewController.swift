//
//  WelcomeViewController.swift
//  Authorization
//
//  Created by mac on 28.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeName: UILabel!
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingGradientColor()
        
        welcomeName.text = "Welcome \(userName ?? "")!"
    }
}


extension WelcomeViewController {
    
    func settingGradientColor() {
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


