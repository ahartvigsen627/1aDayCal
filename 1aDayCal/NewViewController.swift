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
    
    @IBAction func shareButton(sender: AnyObject) {
    }
    
    var image = UIImage()
    var geekText = "test"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = self.image
        self.textView.text = self.geekText
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
