//
//  SettingsViewController.swift
//  1aDayCal
//
//  Created by Adam Hartvigsen on 4/26/16.
//  Copyright © 2016 Geek Mind Fusion. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let prefs = NSUserDefaults.standardUserDefaults()
    let dateFormatter = NSDateFormatter()
    
    var resetAlert = UIAlertController(title: "Reset", message: "Are you sure you want to reset your calendar?", preferredStyle: UIAlertControllerStyle.Alert)

    @IBAction func resetCalendar(sender: AnyObject) {
        resetAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {(action: UIAlertAction!) in
        self.dateFormatter.dateFormat = "yyyy-MM-dd"
        self.prefs.setValue(self.dateFormatter.stringFromDate(NSDate()), forKey: "StartDate")
        }))

        resetAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: {(action: UIAlertAction!) in
        }))
        
        presentViewController(resetAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
