//
//  NewsfeedCell.swift
//  VK News Feed Demo
//
//  Created by   admin on 05.09.2020.
//  Copyright © 2020 Evgeny Ezub. All rights reserved.
//

import Foundation
import UIKit

protocol FeedCellViewModel {
    var iconUrlString: String { get }
    var name: String { get }
    var date: String { get }
    var text: String? { get }
    
    var likes: String? { get }
    var comments: String? { get }
    var shares: String? { get }
    var views: String? { get }
    var photoAttachment: FeedCellPhotoAttachmentViewModel? { get }
}
protocol FeedCellPhotoAttachmentViewModel {
    var photoUrl: String? { get }
    var width: Int { get }
    var height: Int { get }
}

class NewsfeedCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: WebImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var sharesLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    @IBOutlet weak var postImageView: WebImageView!
    
    static let reuseId = "NewsfeedCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.iconImageView.layer.cornerRadius = iconImageView.frame.height / 2
        self.iconImageView.clipsToBounds = true
    }
    
    func set(viewModel: FeedCellViewModel) {
        iconImageView.setImage(string: viewModel.iconUrlString)
                
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        likesLabel.text = viewModel.likes
        commentsLabel.text = viewModel.comments
        sharesLabel.text = viewModel.shares
        viewsLabel.text = viewModel.views
        if let photoAttachment = viewModel.photoAttachment {
            postImageView.setImage(string: photoAttachment.photoUrl)
            postImageView.isHidden = false
        } else {
            postImageView.isHidden = true
        }
    }
}
