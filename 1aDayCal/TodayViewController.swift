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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
