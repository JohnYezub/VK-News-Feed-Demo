//
//  FeedViewController.swift
//  VK News Feed Demo
//
//  Created by   admin on 21.07.2020.
//  Copyright © 2020 Evgeny Ezub. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var networkDataFetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8782210946, green: 0.941388011, blue: 1, alpha: 1)
        
        networkDataFetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map({ (feedItem) in
                print(feedItem.date)
            })
        }
    }
    
}

