//
//  FreePlayerControllerViewController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 3/31/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class FreePlayerControllerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var nameData: [String] = ["菜鸟飞飞", "特洛伊", "皇家马德比", "a", "a", "a", "a", "a"]
    var locData: [String] = ["东单", "朝阳公园", "四德", "a", "a", "a", "a", "a"]
    var timeData: [String] = ["9:00-11:00", "15:00-17:00", "19:00-21:00", "a", "a", "a", "a", "a"]
    var imageData: [String] = [""]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameData.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var object = PFObject(className: "Countries");
        let cell: ColViewCellController = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as ColViewCellController
        cell.nameCell.text = nameData[indexPath.row]
        cell.locCell.text = locData[indexPath.row]
        cell.timeCell.text = timeData[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("Cell \(indexPath.row) selected")
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
