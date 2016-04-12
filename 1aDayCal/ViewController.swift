//
//  ViewController.swift
//  1aDayCal
//
//  Created by Adam Hartvigsen on 8/19/15.
//  Copyright (c) 2015 Geek Mind Fusion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let currentDate = NSDate()
    let dateFormatter = NSDateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showToday"){
            let vc = segue.destinationViewController as! TodayViewController
            
            self.dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            vc.title = self.dateFormatter.stringFromDate(currentDate)
        }
    }


}

