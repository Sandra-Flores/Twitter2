//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    var id: Int64
    var name: String?
    var screenName: String?
    var imageUrl: URL
    var bannerImageURL: URL
    
    var followersCount: Int
    var followingCount: Int
    var tweetsCount: Int
    var description: String
    
    // For user persistance
    var dictionary: [String: Any]?
    private static var _current: User?
    
    static var current: User? {
        get {
            if _current == nil {
                let defaults = UserDefaults.standard
                if let userData = defaults.data(forKey: "currentUserData") {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! [String: Any]
                    _current = User(dictionary: dictionary)
                }
            }
            return _current
        }
        set (user) {
            _current = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
        }
    }

    init(dictionary: [String: Any]) {
        
        id = dictionary["id"] as! Int64
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        imageUrl = URL(string: dictionary["profile_image_url_https"] as! String)!
        
        followersCount = dictionary["followers_count"] as! Int
        followingCount = dictionary["friends_count"] as! Int
        description = dictionary["description"] as! String
        tweetsCount = dictionary["statuses_count"] as! Int
        
        if !(dictionary["profile_banner_url"] == nil)  {
            bannerImageURL = URL(string:dictionary["profile_banner_url"] as! String)!
        }else{
            bannerImageURL = URL(string:"http://orig02.deviantart.net/b235/f/2011/292/7/a/windows_8_blue_grain_by_ipur-d4dbkwa.jpg")!
        }
        
        self.dictionary = dictionary
    }
    
    
}
