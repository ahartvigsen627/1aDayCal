 //
//  ViewController.swift
//  1aDayCal
//
//  Created by Adam Hartvigsen on 8/19/15.
//  Copyright (c) 2015 Geek Mind Fusion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// These Constants are the core of the apps data. imageArray contains the list and order of all images used for the 1aDay calender. geekSayings contains the list of Strings corresponding to the
    /// imageArray. geekLinks contains the list of URLs in string format that corresponds to the imageArray. dateformatter is used to get all dates on the main page formatted correctly. prefs is the
    /// standard user default variables which is used to keep track of the startDate regardless of updates and app being dismissed from multitasking.
    let imageArray = [UIImage(named: "Apple Devices"), UIImage(named: "Matrix SS"), UIImage(named: "Multi Screen"), UIImage(named: "Office Decorations"), UIImage(named: "Phone Bean Bag"), UIImage(named: "Vulcan Hand Gesture"), UIImage(named: "Minions USB"), UIImage(named: "Rebel Ships"), UIImage(named: "Star Wars Mug"), UIImage(named: "Star Wars Weekend"), UIImage(named: "UNIX Commands"), UIImage(named: "Windows Phone"), UIImage(named: "Windows Update")]
    let geekSayings = ["you own a Mac, iPad and iPhone.", "you have a Matrix Screen Saver.", "you use more than 1 computer Screen.", "you decorate your Office with obscure video game print outs.", "you have a bean bag for your phone.", "the Vulcan salute is a normal farewell.", "you have a Minions USB Drive.", "you can name more than 3 Rebel ships.", "you have a Star Wars themed mug.", "you go to Disney World specifically for Star Wars weekends.", "you know more than 5 unix commands.", "you own a Windows phone.", "you upgrade to the newest windows OS the day it is released."]
    let geekLinks = ["http://www.apple.com", "http://matrixsaver.en.softonic.com/mac", "https://www.google.com/search?client=safari&rls=en&q=how+to+use+more+than+one+monitor&ie=UTF-8&oe=UTF-8", "http://theportalwiki.com/wiki/Aperture_Science", "http://www.adobe.com", "https://en.wikipedia.org/wiki/Vulcan_salute", "http://www.minionsmovie.com/minions.html", "http://starwars.wikia.com/wiki/Alliance_Fleet", "http://www.thinkgeek.com/homeoffice/mugs-travel/", "https://en.wikipedia.org/wiki/Star_Wars_Weekends", "http://mally.stanford.edu/~sr/computing/basic-unix.html", "https://www.microsoft.com/en-us/windows/phones", "http://windows.microsoft.com/en-us/windows/windows-update"]
    let dateFormatter = NSDateFormatter()
    let prefs = NSUserDefaults.standardUserDefaults()
    
    /// These variables are initially declaired and given default values here. They are then used later to calculate and store the correct values in viewDidLoad()
    var dateAsString = "2016-04-08"
    var currentDate = NSDate()
    var startDate = NSDate()
    var elapseDays = 1
    var diffDateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Day], fromDate: NSDate(), toDate: NSDate(), options: NSCalendarOptions.init(rawValue: 0))

    /**
     In viewDidLoad, dateFormatter has the dateFormat set. Then prefs is used to check if the app has been launched before. If it has not then the HasBeenLaunched variable is set to true
     and the startDate is set to the current date on the device. The currentDate is set to the current date on the device, and the startDate is grabbed from prefs. The last thing is the 
     elapsed days from startDate to CurrentDate is calculated then stored.
    */
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
    
    /**
     Function prepareForSegue does preparation needed before leaving the main page. First viewDidLoad() is called to make sure that dates and elaspsedDays are updated. Next the segue is 
     detemined as either showToday or previousDays. The specific view controller is the grabbed based on the segue. For showToday the date is formatted and sent to the title of the view
     controller. It is then determined if the elapsedDays is greater than the size of the 3 main arrays. If it is larger a default image, saying and link are sent to the view controller.
     If elapseDays is smaller then the objects at the position of the elapseDays in the array are sent to the view controller. If the segue is previousDays then the 3 arrays and startDate
     are sent to the view controller. It then checks if elapseDays is greater than the size of the 3 arrays. If it is then size of the arrays is sent to the view controller. Otherwise 
     elapseDays is sent
     
     - parameters
        - sugue:  The specific segue that has been sent with the call.
        - sender: The object(button) that sent the call
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.viewDidLoad()
        if (segue.identifier == "showToday"){
            let vc = segue.destinationViewController as! TodayViewController
            self.dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            
            vc.title = self.dateFormatter.stringFromDate(currentDate)
            
            if(self.elapseDays >= self.imageArray.count){
                vc.image = UIImage(named: "mist")!
                vc.geekText = "you reach the end of this calendar. We hope you had a good year!"
                vc.geekLink = "http://www.apple.com"
            }else{
                vc.image = self.imageArray[self.elapseDays]!
                vc.geekText = self.geekSayings[self.elapseDays]
                vc.geekLink = self.geekLinks[self.elapseDays]
            }
        }else if(segue.identifier == "previousDays"){
            let vc = segue.destinationViewController as! CollectionViewController
            
            vc.imageArray = self.imageArray
            vc.geekSayings = self.geekSayings
            vc.startDate = self.startDate
            vc.geekLinks = self.geekLinks
            if(self.elapseDays > self.imageArray.count){
                vc.elapseDays = self.imageArray.count
            }else{
                vc.elapseDays = self.elapseDays
            }
        }
    }
}

