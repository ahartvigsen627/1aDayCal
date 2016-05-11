//
//  NewViewController.swift
//  1aDayCal
//
//  Created by Adam Hartvigsen on 3/29/16.
//  Copyright © 2016 Geek Mind Fusion. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    
    
    var image = UIImage()
    var geekText = "test"
    var geekLink = "http://www.apple.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = self.image
        self.textView.text = self.geekText
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shareButton(sender: AnyObject) {
        if let myWebsite = NSURL(string: "https://www.linkedin.com/in/adam-hartvigsen-a8120547"){
        let message :String = "You may possibly be a geek when \(geekText)"
        let shareImage :UIImage = self.image
        let shareItems :Array = [message, shareImage, myWebsite]
        let activityController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        if(UIDevice.currentDevice().userInterfaceIdiom == .Pad){
            activityController.popoverPresentationController?.sourceView = self.view
        }
        self.presentViewController(activityController, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func LearnMore(sender: AnyObject) {
        let url = NSURL(string: geekLink)
        UIApplication.sharedApplication().openURL(url!)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
