//
//  AboutMeViewController.swift
//  Authorization
//
//  Created by mac on 01.04.2022.
//

import UIKit

class AboutMeViewController: UIViewController {

   
    @IBOutlet var textAboutMe: UILabel!
    
    @IBOutlet var headingNC: UINavigationItem!
    
    var aboutMe = ""
    var hading = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textAboutMe.text = aboutMe
        headingNC.title = hading
    }
    



}
