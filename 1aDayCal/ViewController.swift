//
//  ViewController.swift
//  1aDayCal
//
//  Created by Adam Hartvigsen on 8/19/15.
//  Copyright (c) 2015 Geek Mind Fusion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let testArray = ["13", "12", "11", "10", "9", "8", "7", "6", "5", "4", "3", "2", "1"]
    let imageArray = [UIImage(named: "Apple Devices"), UIImage(named: "Matrix SS"), UIImage(named: "Multi Screen"), UIImage(named: "Office Decorations"), UIImage(named: "Phone Bean Bag"), UIImage(named: "Vulcan Hand Gesture"), UIImage(named: "Minions USB"), UIImage(named: "Rebel Ships"), UIImage(named: "Star Wars Mug"), UIImage(named: "Star Wars Weekend"), UIImage(named: "UNIX Commands"), UIImage(named: "Windows Phone"), UIImage(named: "Windows Update")]
    let geekSayings = ["you own a Mac, iPad and iPhone.", "you have a Matrix Screen Saver.", "you use more than 1 computer Screen.", "you decorate your Office with obscure video game print outs.", "you have a bean bag for your phone.", "the Vulcan hand gesture is a normal farwell.", "you have a Minions USB Drive.", "you can name more than 3 Rebel ships.", "you have a Star Wars themed mug.", "you go to Disney World specifically for Star Wars weekends.", "you know more than 5 unix commands.", "you own a Windows phone.", "you upgrade to the newest windows OS the day it is released."]
    
    let currentDate = NSDate()
    let dateFormatter = NSDateFormatter()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateAsString = "2016-04-08"
        let date1 = dateFormatter.dateFromString(dateAsString)!
        
        var diffDateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Day], fromDate: date1, toDate: currentDate, options: NSCalendarOptions.init(rawValue: 0))
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
            vc.image = self.imageArray[1]!
            vc.geekText = self.geekSayings[1]
        }else if(segue.identifier == "previousDays"){
            let vc = segue.destinationViewController as! CollectionViewController
            
            vc.calDays = testArray
            vc.imageArray = self.imageArray
            vc.geekSayings = self.geekSayings
        }
    }


}

