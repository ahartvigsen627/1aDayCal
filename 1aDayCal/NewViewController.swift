//
//  NewViewController.swift
//  1aDayCal
//
//  Created by Adam Hartvigsen on 3/29/16.
//  Copyright © 2016 Geek Mind Fusion. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    /// These Outlets connect to the imageView and textView on the Previous Days Detail page.
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    /// These default variable get set in the overrided prepareForSegue function of CollectionViewController
    var image = UIImage()
    var geekText = "test"
    var geekLink = "http://www.apple.com"
    
    /// In viewDidLoad the image component of imageView is set to image which is passed in from prepareForSegue in CollectionViewController.
    /// The text component of textView is set to the String that is passed in from prepareForSegue in CollectionViewController.
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = self.image
        self.textView.text = self.geekText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     This action handles the Share Button. It shares the geek saying, image and link. It then opens
     the sharing popup.
     
     - Parameters:
        - sender: The object(button) that sends the call
    */
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
    
    /**
     This action handles the Learn More button. It takes the geek link and opens it in Safari
     
     - Parameters:
        - sender: The object(button) that sends the call
    */
    @IBAction func LearnMore(sender: AnyObject) {
        let url = NSURL(string: geekLink)
        UIApplication.sharedApplication().openURL(url!)
    }
}
