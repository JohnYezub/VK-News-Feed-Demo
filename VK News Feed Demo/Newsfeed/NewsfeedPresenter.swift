//
//  NewsfeedPresenter.swift
//  VK News Feed Demo
//
//  Created by   admin on 30.07.2020.
//  Copyright (c) 2020 Evgeny Ezub. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
  func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
  weak var viewController: NewsfeedDisplayLogic?
  
  func presentData(response: Newsfeed.Model.Response.ResponseType) {
  
    switch response {
       
    case .presentNewsFeed(feed: let feed):
        
        let cells = feed.items.map { (item) in
            cellViewModel(from: item)
        }
        
        let feedViewModel = FeedViewModel.init(cells: cells)
        
        viewController?.displayData(viewModel: Newsfeed.Model.ViewModel.ViewModelData.displayNewsFeed(feedViewModel: feedViewModel))
    }
    
    func cellViewModel(from feedItem: FeedItem) -> FeedViewModel.Cell {
        return FeedViewModel.Cell.init(iconUrlString: "",
                                       name: "name",
                                       date: "\(feedItem.date)",
                                       text: feedItem.text,
                                       likes:  String(feedItem.likes?.count ?? 0),
                                       comments:  String(feedItem.comments?.count ?? 0),
                                       shares:  String(feedItem.reposts?.count ?? 0),
                                       views: String(feedItem.views?.count ?? 0))
    }
  
}
}
