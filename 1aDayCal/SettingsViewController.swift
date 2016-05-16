//
//  SettingsViewController.swift
//  1aDayCal
//
//  Created by Adam Hartvigsen on 4/26/16.
//  Copyright © 2016 Geek Mind Fusion. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    /// These constants get the User Defaults for the program and the Date Formatter
    let prefs = NSUserDefaults.standardUserDefaults()
    let dateFormatter = NSDateFormatter()
    
    /// This variable contains the set up for the Reset Calendar allert
    var resetAlert = UIAlertController(title: "Reset", message: "Are you sure you want to reset your calendar?", preferredStyle: UIAlertControllerStyle.Alert)
    
    /**
     This action funtion activates the Reset Calendar alert. Upon OK being selected the StartDate User Default is set to the current date. Upon cancel being selected nothing happens and the alert is dimissed
     
     - Parameters
        sender: The object that sends the call
    */
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
}
