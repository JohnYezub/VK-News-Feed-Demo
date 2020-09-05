//
//  NewsfeedCell.swift
//  VK News Feed Demo
//
//  Created by   admin on 05.09.2020.
//  Copyright © 2020 Evgeny Ezub. All rights reserved.
//

import Foundation
import UIKit
class NewsfeedCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var sharesLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    static let reuseId = "NewsfeedCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
