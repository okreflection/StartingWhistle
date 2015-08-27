//
//  FreePlayerControllerViewController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 3/31/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class FreePlayerControllerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var gameList = [Game]()
    
    var userNames = [[String]]()
    var pidsArr = [[Int]]()
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var mydb : db?
    
    var count : Int!
    
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
        var currentUser = PFUser.currentUser()!
        
        gameList = mydb!.getGames(currentUser["city"] as! String)
        
        for game in gameList {
            pidsArr.append(game.getPids())
        }

        println("gamelist count: ", gameList.count)
        
        count = gameList.count
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.myCollectionView.reloadData()
        })
        
    }
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        println("gamelist2 count: ", gameList.count)
        return count!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: ColViewCellController = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! ColViewCellController
        
        var game = gameList[indexPath.row]
        
        var thisgamePids = pidsArr[indexPath.row]
        
        if (cell.contentViewController == nil) {
            
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            var newController:CellViewController = storyboard.instantiateViewControllerWithIdentifier("CellViewController") as! CellViewController
            
            newController.viewDidAppear(false, pids:thisgamePids)
            
            cell.contentViewController = newController
            cell.contentView.addSubview(cell.contentViewController.view)
            
        }
      
        cell.contentViewController.locCell.text = game.getLoc()
        cell.contentViewController.timeCell.text = game.getTime()
        cell.contentViewController.dateCell.text = game.getDate()
        cell.contentViewController.partiCell.text = "Participants: " + String(game.getPids().count)
        
        var time = gameList[indexPath.row].getStartTime()
        var fulltimeArr = split(time) {$0 == " "}
        var hourMin  = fulltimeArr[0]
        var ampm = fulltimeArr[1]
        var hourMinArr = split(hourMin) {$0 == ":"}
        var hr = hourMinArr[0]
        var min = hourMinArr[1]
        
        cell.contentViewController.partiCell.textColor = UIColor.blackColor()
        cell.contentViewController.dateCell.textColor = UIColor.blackColor()
        cell.contentViewController.timeCell.textColor = UIColor.blackColor()
        cell.contentViewController.locCell.textColor = UIColor.blackColor()
        cell.contentViewController.nameCell.textColor = UIColor.blackColor()
        cell.contentViewController.ratingCell.textColor = UIColor.blackColor()
        
        if (hr.toInt() >= 6 && hr.toInt() <= 8 && ampm == "AM") {
            cell.contentViewController.backImg.image = UIImage(named: "morning.jpg")
        } else if (hr.toInt() >= 9 && hr.toInt() <= 11 && ampm == "AM" || hr.toInt() >= 12 && hr.toInt() <= 2 && ampm == "PM") {
            cell.contentViewController.backImg.image = UIImage(named: "noon.jpg")
        } else if (hr.toInt() >= 3 && hr.toInt() <= 4 && ampm == "PM") {
            cell.contentViewController.backImg.image = UIImage(named: "earlyafternoon.jpg")
        } else if (hr.toInt() >= 5 && hr.toInt() <= 6 && ampm == "PM") {
            cell.contentViewController.backImg.image = UIImage(named: "lateafternoon.jpg")
        } else {
            cell.contentViewController.backImg.image = UIImage(named: "night.jpg")
            cell.contentViewController.partiCell.textColor = UIColor.whiteColor()
            cell.contentViewController.dateCell.textColor = UIColor.whiteColor()
            cell.contentViewController.timeCell.textColor = UIColor.whiteColor()
            cell.contentViewController.locCell.textColor = UIColor.whiteColor()
            cell.contentViewController.nameCell.textColor = UIColor.whiteColor()
            cell.contentViewController.ratingCell.textColor = UIColor.whiteColor()
        }
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("Cell \(indexPath.row) selected")
        var currentGame = CurrentGame.sharedInstance
        currentGame.setGame(gameList[indexPath.row])
        let gamePage = self.storyboard?.instantiateViewControllerWithIdentifier("GameViewController") as! GameViewController
        self.navigationController?.pushViewController(gamePage, animated: true)
        
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
