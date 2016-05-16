//
//  TodayViewController.swift
//  1aDayCal
//
//  Created by Adam Hartvigsen on 4/11/16.
//  Copyright © 2016 Geek Mind Fusion. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var image = UIImage()
    var geekText = "test"
    var geekLink = "http://www.apple.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = self.image
        self.textView.text = self.geekText

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func shareButton(sender: AnyObject) {
        if let myWebsite = NSURL(string: "https://itunes.apple.com/us/genre/ios-games/id6014?mt=8"){
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
    

    @IBAction func learnMore(sender: AnyObject) {
        let url = NSURL(string: geekLink)
        UIApplication.sharedApplication().openURL(url!)
    }
}
