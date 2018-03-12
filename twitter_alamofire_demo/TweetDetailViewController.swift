//
//  TweetDetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Sandra Flores on 3/10/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var tweet: Tweet!
    @IBOutlet weak var detailTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "tweetDetailCell_top", for: indexPath) as! tweetDetailCell_top
            cell.tweet = tweet
            return cell
        }
        else if(indexPath.row == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "tweetDetailCell_middle", for: indexPath) as! tweetDetailCell_middle
            cell.tweet = tweet
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tweetDetailCell_bottom", for: indexPath) as! tweetDetailCell_bottom
            cell.tweet = tweet
            return cell
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
