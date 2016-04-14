//
//  CollectionViewController.swift
//  1aDayCal
//
//  Created by Adam Hartvigsen on 3/30/16.
//  Copyright © 2016 Geek Mind Fusion. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let dateFormatter = NSDateFormatter()
    
    var imageArray = [UIImage(named: "Apple Devices")]
    var geekSayings = ["you own a Mac, iPad and iPhone."]
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
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.elapseDays
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        let calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: indexPath.row, toDate: self.startDate, options: NSCalendarOptions.init(rawValue: 0))
        
        cell.imageView?.image = self.imageArray[indexPath.row]
        
        self.dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        cell.titleLabel?.text = self.dateFormatter.stringFromDate(calculatedDate!)
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showImage", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showImage"{
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            let calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: indexPath.row, toDate: self.startDate, options: NSCalendarOptions.init(rawValue: 0))
            let vc = segue.destinationViewController as! NewViewController
            
            vc.image = self.imageArray[indexPath.row]!
//            vc.title = self.calDays[indexPath.row]
            self.dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
            vc.title = self.dateFormatter.stringFromDate(calculatedDate!)
            vc.geekText = self.geekSayings[indexPath.row]
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
