//
//  NetworkDataFetcher.swift
//  VK News Feed Demo
//
//  Created by   admin on 25.07.2020.
//  Copyright © 2020 Evgeny Ezub. All rights reserved.
//

import Foundation

protocol DataFetcher {
    func getFeed(response: @escaping (FeedResponse?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {
    
    let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func getFeed(response: @escaping (FeedResponse?) -> Void) {
        let params = ["filter" : "post, photo"]
        networking.request(path: API.newsFeed, params: params) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                response(nil)
            }
            let decoded = self.decodeJSON(type: FeedResponseWrapped.self, data: data)
            response(decoded?.response)
        }
        
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> FeedResponseWrapped? {
        let decoder = JSONDecoder()
       decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response: FeedResponseWrapped?
        if let data = data {
            do {
                let response1 = try decoder.decode(type.self, from: data)
                response = response1 as? FeedResponseWrapped
                print(response1 as Any)
              
            } catch let error {
                print("decodeJSON:")
                print(error)
                print(error.localizedDescription)
                return nil
            }
            return response

        } else {
            print("decoded nil")
            return nil
        }
        
    }
    
    
}


