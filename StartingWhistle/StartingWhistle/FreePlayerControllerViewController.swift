//
//  FreePlayerControllerViewController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 3/31/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class FreePlayerControllerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
//    var nameData: [String] = ["菜鸟飞飞", "特洛伊", "皇家马德比", "a", "a", "a", "a", "a"]
//    var locData: [String] = ["东单", "朝阳公园", "四德", "a", "a", "a", "a", "a"]
//    var timeData: [String] = ["9:00-11:00", "15:00-17:00", "19:00-21:00", "a", "a", "a", "a", "a"]
//    var imageData: [String] = [""]

    var nameData = [String]()
    var locData = [String]()
    var timeData = [String]()
    var imageData = [String]()
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var newColor = UIColor.whiteColor().CGColor
    
    var mydb : db?
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let sectionInsets = UIEdgeInsets(top: 40.0, left: 10.0, bottom: 0.0, right: 10.0)
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        
        mydb = db()
        var currentUser = PFUser.currentUser()
        
        var table = mydb!.getPosts(currentUser["city"] as String)
        
        if table.count != 0 {
            for list in table {
                nameData.append(list[0] + "'s team")
                locData.append(list[1])
                timeData.append(list[2] + " - " + list[3])
            }
        }
        
        println(table.count)
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.myCollectionView.reloadData()
        })
        
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameData.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: ColViewCellController = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as ColViewCellController
//        cell.nameCell.text = nameData[indexPath.row]
        cell.locCell.text = locData[indexPath.row]
        cell.timeCell.text = timeData[indexPath.row]
        cell.timeCell.numberOfLines = 2;
        cell.timeCell.adjustsFontSizeToFitWidth = true
        cell.timeCell.minimumScaleFactor = 0.1
        
        cell.muserIcon.layer.cornerRadius = cell.muserIcon.frame.size.width / 2;
        
        cell.muserIcon.layer.borderWidth = 3.0
        cell.muserIcon.clipsToBounds = true

        cell.muserIcon.layer.borderColor = newColor
        
        cell.playerIcon.layer.cornerRadius = cell.playerIcon.frame.size.width / 2;
        
        cell.playerIcon.layer.borderWidth = 3.0
        cell.playerIcon.clipsToBounds = true
        
        cell.playerIcon.layer.borderColor = newColor

        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("Cell \(indexPath.row) selected")
    }
    
//    func collectionView(collectionView: UICollectionView!,
//        layout collectionViewLayout: UICollectionViewLayout!,
//        sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
//            return CGSize(width: 375, height: 104)
//    }
//    
//    func collectionView(collectionView: UICollectionView!,
//        layout collectionViewLayout: UICollectionViewLayout!,
//        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//            return sectionInsets
//    }
    
//    func collectionView(collectionView: UICollectionView!,
//        layout collectionViewLayout: UICollectionViewLayout!,
//        minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
//            return 30
//    }
//    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
            return 0
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
