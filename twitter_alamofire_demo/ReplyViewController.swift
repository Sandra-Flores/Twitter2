//
//  ReplyViewController.swift
//  twitter_alamofire_demo
//
//  Created by Sandra Flores on 3/11/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import RSKPlaceholderTextView

protocol ReplyViewControllerDelegate: NSObjectProtocol {
    func did(post: Tweet)
}

class ReplyViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var messageTitle: UILabel!
    @IBOutlet weak var replyTextView: RSKPlaceholderTextView!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    
    weak var delegate: ReplyViewControllerDelegate?
    var idString = ""
    var tweet: Tweet!{
        didSet{
            idString = tweet.idString
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        replyTextView.placeholder = "Type in here!"
        replyTextView.delegate = self
    }

    @IBAction func onReplyButtonPress(_ sender: Any) {
        
        let tweetText = replyTextView.text
        
        APIManager.shared.replyTweet(with: tweetText!, with: idString) { (tweet, error) in
        
            if let error = error {
                print("Error replying Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Reply Tweet Success!")
            }
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // TODO: Check the proposed new text character count
        // Allow or disallow the new text
        
        // Set the max character limit
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        characterCountLabel.text = String(characterLimit - newText.characters.count)
        
        // The new text should be allowed? True/False
        return newText.characters.count < characterLimit
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
