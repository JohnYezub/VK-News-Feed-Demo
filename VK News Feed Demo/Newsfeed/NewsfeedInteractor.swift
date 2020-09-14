//
//  NewsfeedInteractor.swift
//  VK News Feed Demo
//
//  Created by   admin on 30.07.2020.
//  Copyright (c) 2020 Evgeny Ezub. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
  func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {

  var presenter: NewsfeedPresentationLogic?
  var service: NewsfeedService?
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
  func makeRequest(request: Newsfeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsfeedService()
    }
    switch request {
   
    case .getNewsFeed:
        fetcher.getFeed { [weak self](response) in
            guard let response = response else { return }
            
            response.profiles.map { (profile) in
                print("\(profile) \n\n")
            }
            
            self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsFeed(feed: response))
        }
        print("interactor getFeed")
        
    }
  }
  
}
