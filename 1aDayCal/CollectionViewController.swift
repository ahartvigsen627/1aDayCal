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
    
    let calDays = ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6"]
    let imageArray = [UIImage(named: "Apple Devices"), UIImage(named: "Matrix SS"), UIImage(named: "Multi Screen"), UIImage(named: "Office Decorations"), UIImage(named: "Phone Bean Bag"), UIImage(named: "Vulcan Hand Gesture")]
    let geekSayings = ["you own a Mac, iPad and iPhone.", "you have a Matrix Screen Saver.", "you use more than 1 computer Screen.", "you decorate your Office with obscure video game print outs.", "you have a bean bag for your phone.", "the Vulcan hand gesture is a normal farwell."]
    
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
        
        cell.imageView?.image = self.imageArray[indexPath.row]
        
        cell.titleLabel?.text = self.calDays[indexPath.row]
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showImage", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showImage"{
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destinationViewController as! NewViewController
            
            vc.image = self.imageArray[indexPath.row]!
            vc.title = self.calDays[indexPath.row]
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
