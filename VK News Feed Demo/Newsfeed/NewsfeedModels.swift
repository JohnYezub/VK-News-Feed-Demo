//
//  NewsfeedModels.swift
//  VK News Feed Demo
//
//  Created by   admin on 30.07.2020.
//  Copyright (c) 2020 Evgeny Ezub. All rights reserved.
//

import UIKit

enum Newsfeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case some
        case getFeed
      }
    }
    struct Response {
      enum ResponseType {
        case some
        case presentNewsFeed
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
        case displayNewsFeed
      }
    }
  }
  
}
