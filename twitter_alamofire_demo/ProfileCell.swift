//
//  ProfileCell.swift
//  twitter_alamofire_demo
//
//  Created by Sandra Flores on 3/10/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userScreenName: UILabel!
    @IBOutlet weak var userDescription: UILabel!
    @IBOutlet weak var tweetsCount: UILabel!
    @IBOutlet weak var tweetsLabel: UILabel!
    @IBOutlet weak var followersCount: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    
    
    
    var user: User!{
        didSet{
            
            bannerImage.af_setImage(withURL: user.bannerImageURL)
            userProfileImage.af_setImage(withURL: user.imageUrl)
            userName.text = user.name
            userScreenName.text = user.screenName
            userDescription.text = user.description
            tweetsCount.text = "\(user.tweetsCount)"
            followersCount.text = "\(user.followersCount)"
            followingCount.text = "\(user.followingCount)"
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
