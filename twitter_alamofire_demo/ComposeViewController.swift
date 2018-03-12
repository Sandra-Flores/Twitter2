//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Sandra Flores on 3/10/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import RSKPlaceholderTextView

protocol ComposeViewControllerDelegate: NSObjectProtocol {
    func did(post: Tweet)
}

class ComposeViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var textCountLabel: UILabel!
    @IBOutlet weak var postTextField: RSKPlaceholderTextView!
    @IBOutlet weak var postButton: UIButton!
    

    weak var delegate: ComposeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postTextField.placeholder = "Whats up?"
        
        userProfileImage.af_setImage(withURL: (User.current?.imageUrl)!)
        
        postButton.isUserInteractionEnabled = true

        postTextField.becomeFirstResponder()
        postTextField.delegate = self
    }

    @IBAction func didTapPost(_ sender: Any) {
        
        APIManager.shared.composeTweet(with: postTextField.text) { (tweet, error) in
            
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // TODO: Check the proposed new text character count
        // Allow or disallow the new text
        // Set the max character limit
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        textCountLabel.text = "\(characterLimit - newText.count)"
        // The new text should be allowed? True/False
        return newText.count < characterLimit
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
