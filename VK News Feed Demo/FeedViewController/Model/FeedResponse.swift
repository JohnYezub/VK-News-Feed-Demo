//
//  FeedResponse.swift
//  VK News Feed Demo
//
//  Created by   admin on 25.07.2020.
//  Copyright © 2020 Evgeny Ezub. All rights reserved.
//

import Foundation

struct FeedResponseWrapped: Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [FeedItem]
}

struct FeedItem: Decodable {
    let source_id: Int
    let post_id: Int?
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let reposts: CountableItem?
    let views: CountableItem?
    
}

struct Like: Decodable {
    
    let count, user_likes, can_like, can_publish: Int
    
}

struct CountableItem: Decodable {
    let count: Int
}
