//
//  CollectionViewController.swift
//  1aDayCal
//
//  Created by Adam Hartvigsen on 3/30/16.
//  Copyright © 2016 Geek Mind Fusion. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    /// This Outlet is connected to the collection view on the Previous Days page.
    @IBOutlet weak var collectionView: UICollectionView!
    
    /// This constant is used to handle any date formatting needs for the Previous Days page.
    let dateFormatter = NSDateFormatter()
    
    /// These default variable are set in the overrided prepareForSegue function of ViewController.
    var imageArray = [UIImage(named: "Apple Devices")]
    var geekSayings = ["you own a Mac, iPad and iPhone."]
    var geekLinks = ["http://www.apple.com"]
    var elapseDays = 1
    var startDate = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Returns the number of elapsed day to determine the number of collectionView cells to create.
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.elapseDays
    }
    
    /// This function grabs the image and calculated date from the inputted index path and sets the cells attributes to these values. The cell is then returned.
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        let calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: indexPath.row, toDate: self.startDate, options: NSCalendarOptions.init(rawValue: 0))
        
        cell.imageView?.image = self.imageArray[indexPath.row]
        
        self.dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        cell.titleLabel?.text = self.dateFormatter.stringFromDate(calculatedDate!)
        
        return cell
    }
    
    /// This function sends the specific cell that is selected from the collection view to the segue.
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showImage", sender: self)
    }
    
    /**
     Function prepareForSegue does preparation needed before leaving the main page. The segue is detemined. The specific index path is determined and view controller is the grabbed based on the segue. The date is calculated based on the index path. The image, geek text, and geek link(at the specified index path), along with the formated date are sent to  and  set to the view controllers variables.
     
     - parameters
     - sugue:  The specific segue that has been sent with the call.
     - sender: The object(button) that sent the call
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showImage"{
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            let calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: indexPath.row, toDate: self.startDate, options: NSCalendarOptions.init(rawValue: 0))
            let vc = segue.destinationViewController as! NewViewController
            
            vc.image = self.imageArray[indexPath.row]!
            self.dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            vc.title = self.dateFormatter.stringFromDate(calculatedDate!)
            vc.geekText = self.geekSayings[indexPath.row]
            vc.geekLink = self.geekLinks[indexPath.row]
        }
    }
}
