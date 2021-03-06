//
//  FeedResponse.swift
//  VK News Feed Demo
//
//  Created by   admin on 12.09.2020.
//  Copyright © 2020 Evgeny Ezub. All rights reserved.
//

import Foundation

struct FeedResponseWrapped: Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [FeedItem]
    var profiles: [Profile]
    var groups: [Group]
}

struct FeedItem: Decodable {
    let sourceId: Int
    let id: Int?
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let reposts: CountableItem?
    let views: CountableItem?
    let attachments: [Attachment]?
}
struct Attachment: Decodable {
    let photo: Photo?
}
struct Photo: Decodable {
    let id: Int
    let sizes: [PhotoSize]
    var height: Int {
        return getXSize().height
    }
    var width: Int {
        return getXSize().width
    }
    var src: String {
        return getXSize().url
    }
    
    func getXSize() -> PhotoSize {
       if let sizeX = sizes.first(where: { $0.type == "x" }) {
            return sizeX
       } else {
        return PhotoSize(type: "no size", url: "", width: 0, height: 0)
        }
    }
}
struct PhotoSize: Decodable {
    let type: String
    let url: String
    let width: Int
    let height: Int
}

struct CountableItem: Decodable {
    let count: Int
}

protocol ProfileRepresentable {
    var id: Int { get }
    var name: String { get }
    var photo: String { get }
}

struct Profile: Decodable, ProfileRepresentable {
                
    let id: Int
    let firstName: String
    let lastName: String
    let photo100: String
    
    var name: String { return firstName + " " + lastName }
    var photo: String { return photo100 }
}
struct Group: Decodable, ProfileRepresentable {
    
    let id: Int
    let name: String
    let photo100: String
    var photo: String { return photo100 }
}
