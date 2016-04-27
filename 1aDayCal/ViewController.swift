 //
//  ViewController.swift
//  1aDayCal
//
//  Created by Adam Hartvigsen on 8/19/15.
//  Copyright (c) 2015 Geek Mind Fusion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageArray = [UIImage(named: "Apple Devices"), UIImage(named: "Matrix SS"), UIImage(named: "Multi Screen"), UIImage(named: "Office Decorations"), UIImage(named: "Phone Bean Bag"), UIImage(named: "Vulcan Hand Gesture"), UIImage(named: "Minions USB"), UIImage(named: "Rebel Ships"), UIImage(named: "Star Wars Mug"), UIImage(named: "Star Wars Weekend"), UIImage(named: "UNIX Commands"), UIImage(named: "Windows Phone"), UIImage(named: "Windows Update")]
    let geekSayings = ["you own a Mac, iPad and iPhone.", "you have a Matrix Screen Saver.", "you use more than 1 computer Screen.", "you decorate your Office with obscure video game print outs.", "you have a bean bag for your phone.", "the Vulcan hand gesture is a normal farwell.", "you have a Minions USB Drive.", "you can name more than 3 Rebel ships.", "you have a Star Wars themed mug.", "you go to Disney World specifically for Star Wars weekends.", "you know more than 5 unix commands.", "you own a Windows phone.", "you upgrade to the newest windows OS the day it is released."]
    let dateFormatter = NSDateFormatter()
    let prefs = NSUserDefaults.standardUserDefaults()
    
    var dateAsString = "2016-04-08"
    var currentDate = NSDate()
    var startDate = NSDate()
    var elapseDays = 1
    var diffDateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Day], fromDate: NSDate(), toDate: NSDate(), options: NSCalendarOptions.init(rawValue: 0))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if(!prefs.boolForKey("HasBeenLaunched")){
            prefs.setBool(true, forKey: "HasBeenLaunched")
            prefs.setValue(dateFormatter.stringFromDate(currentDate), forKey: "StartDate")
        }
        
        currentDate = NSDate()
        dateAsString = prefs.stringForKey("StartDate")!
        startDate = dateFormatter.dateFromString(dateAsString)!
        
        diffDateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Day], fromDate: startDate, toDate: currentDate, options: NSCalendarOptions.init(rawValue: 0))
        elapseDays = diffDateComponents.day
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.viewDidLoad()
        if (segue.identifier == "showToday"){
            let vc = segue.destinationViewController as! TodayViewController
            self.dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            
            vc.title = self.dateFormatter.stringFromDate(currentDate)
            
            if(self.elapseDays >= self.imageArray.count){
                vc.image = UIImage(named: "mist")!
                vc.geekText = "you reach the end of this calendar. We hope you had a good year!"
            }else{
                vc.image = self.imageArray[self.elapseDays]!
                vc.geekText = self.geekSayings[self.elapseDays]
            }
        }else if(segue.identifier == "previousDays"){
            let vc = segue.destinationViewController as! CollectionViewController
            
            vc.imageArray = self.imageArray
            vc.geekSayings = self.geekSayings
            vc.startDate = self.startDate
            if(self.elapseDays > self.imageArray.count){
                vc.elapseDays = self.imageArray.count
            }else{
                vc.elapseDays = self.elapseDays
            }
        }
    }


}

