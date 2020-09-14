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
            cellViewModel(from: item, profiles: feed.profiles, groups: feed.groups)
        }
        
        let feedViewModel = FeedViewModel.init(cells: cells)
        
        viewController?.displayData(viewModel: Newsfeed.Model.ViewModel.ViewModelData.displayNewsFeed(feedViewModel: feedViewModel))
    }
    
    func cellViewModel(from feedItem: FeedItem, profiles: [Profile], groups: [Group]) -> FeedViewModel.Cell {
        
        let df = DateFormatter()
        df.locale = Locale(identifier: "ru_RU")
        df.dateFormat = "d MMM 'в' HH:mm"
            
        let date = Date(timeIntervalSince1970: feedItem.date)
        let dateTitle = df.string(from: date)
        
        let profile = self.profile(for: feedItem.sourceId, profiles: profiles, groups: groups)
        return FeedViewModel.Cell.init(iconUrlString: profile.photo,
                                       name: profile.name,
                                       date: dateTitle,
                                       text: feedItem.text,
                                       likes:  String(feedItem.likes?.count ?? 0),
                                       comments:  String(feedItem.comments?.count ?? 0),
                                       shares:  String(feedItem.reposts?.count ?? 0),
                                       views: String(feedItem.views?.count ?? 0))
    }
    
}
    
    private func profile(for sourceId: Int, profiles: [Profile], groups: [Group]) -> ProfileRepresentable {
           
           let profileOrGroup: [ProfileRepresentable] = sourceId >= 0 ? profiles : groups
           let normalSourceId = sourceId >= 0 ? sourceId : -sourceId
           let profileRepresentable = profileOrGroup.first { profile in
               profile.id == normalSourceId
           }
           
           return profileRepresentable!
       }
    
}
