//
//  ViewController.swift
//  VK News Feed Demo
//
//  Created by   admin on 21.07.2020.
//  Copyright © 2020 Evgeny Ezub. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService : AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = #colorLiteral(red: 0.8782210946, green: 0.941388011, blue: 1, alpha: 1)
        authService = SceneDelegate.shared().authService
    }

    @IBAction func signInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
}

