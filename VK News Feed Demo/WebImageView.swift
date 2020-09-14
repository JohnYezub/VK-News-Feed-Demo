//
//  WebImageView.swift
//  VK News Feed Demo
//
//  Created by   admin on 14.09.2020.
//  Copyright © 2020 Evgeny Ezub. All rights reserved.
//

import Foundation
import UIKit

class WebImageView: UIImageView {
    
    func setImage(string: String?) {
        
        guard let string = string, let url = URL(string: string) else { return }
        
        if let cached = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cached.data)
            return
        }
        
        let dataTask =  URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    self?.image = UIImage(data: data)
                    self?.handleLoadedImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
    private func handleLoadedImage(data: Data, response: URLResponse?) {
        guard let responseUrl = response!.url else {
            return
        }
        let cachedResponse = CachedURLResponse(response: response!, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseUrl) )
    }
}
