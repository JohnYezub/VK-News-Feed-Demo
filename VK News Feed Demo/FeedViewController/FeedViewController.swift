//
//  FeedViewController.swift
//  VK News Feed Demo
//
//  Created by   admin on 21.07.2020.
//  Copyright © 2020 Evgeny Ezub. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = .blue
        
        networkService.getFeed()
    }
}
