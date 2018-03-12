//
//  tweetDetailCell_top.swift
//  twitter_alamofire_demo
//
//  Created by Sandra Flores on 3/10/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class tweetDetailCell_top: UITableViewCell {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userScreenName: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var tweetCreatedAt: UILabel!
    
    var tweet:Tweet!{
        didSet{
            tweetText.text = tweet.text
            userProfileImage.layer.cornerRadius = 40
            userProfileImage.clipsToBounds = true
            userProfileImage.af_setImage(withURL: tweet.user.imageUrl)
            userName.text = tweet.user.name
            
            userScreenName.text = tweet.user.screenName
            let df = DateFormatter()
            df.dateStyle = .full
            df.timeStyle = .full
            
//            let date = df.date(from: tweet.createdAtString)!
//            df.dateStyle = .short
//            df.timeStyle = .short
//            tweetCreatedAt.text = df.string(from: date)
            tweetCreatedAt.text = tweet.createdAtString
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
