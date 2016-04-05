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
    
    let calDays = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13",]
    let imageArray = [UIImage(named: "Apple Devices"), UIImage(named: "Matrix SS"), UIImage(named: "Multi Screen"), UIImage(named: "Office Decorations"), UIImage(named: "Phone Bean Bag"), UIImage(named: "Vulcan Hand Gesture"), UIImage(named: "Minions USB"), UIImage(named: "Rebel Ships"), UIImage(named: "Star Wars Mug"), UIImage(named: "Star Wars Weekend"), UIImage(named: "UNIX Commands"), UIImage(named: "Windows Phone"), UIImage(named: "Windows Update")]
    let geekSayings = ["you own a Mac, iPad and iPhone.", "you have a Matrix Screen Saver.", "you use more than 1 computer Screen.", "you decorate your Office with obscure video game print outs.", "you have a bean bag for your phone.", "the Vulcan hand gesture is a normal farwell.", "you have a Minions USB Drive.", "you can name more than 3 Rebel ships.", "you have a Star Wars themed mug.", "you go to Disney World specifically for Star Wars weekends.", "you know more than 5 unix commands.", "you own a Windows phone.", "you upgrade to the newest windows OS the day it is released."]
    
    let currentDate = NSDate()
    let dateFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.calDays.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        let calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: indexPath.row, toDate: self.currentDate, options: NSCalendarOptions.init(rawValue: 0))
        
        cell.imageView?.image = self.imageArray[indexPath.row]
        
        //cell.titleLabel?.text = self.calDays[indexPath.row]
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
            let calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: indexPath.row, toDate: self.currentDate, options: NSCalendarOptions.init(rawValue: 0))
            let vc = segue.destinationViewController as! NewViewController
            
            vc.image = self.imageArray[indexPath.row]!
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
