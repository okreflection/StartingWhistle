//
//  CellViewController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 5/4/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class CellViewController: UIViewController {
    
    @IBOutlet weak var nameCell: UILabel!
    
    @IBOutlet weak var dateCell: UILabel!
    
    @IBOutlet weak var ratingCell: UILabel!
    
    @IBOutlet weak var myview: CellView!

    @IBOutlet weak var locCell: UILabel!
    
    @IBOutlet weak var muserIcon: PFImageView!
    
    @IBOutlet weak var timeCell: UILabel!
    
    @IBOutlet weak var backImg: BlurImageView!
    
    @IBOutlet weak var partiCell: UILabel!
    
    var newColor = UIColor.whiteColor().CGColor
    
    var name : String!
    var rating : Float!
    var pids = [Int]()
    
    var animation : CAKeyframeAnimation!
    var animation2 : CAKeyframeAnimation!
    
    var i = 0;
    
    var images = [PFFile]()

    func viewDidAppear(animated : Bool, pids:[Int]) {
        for pid in pids {
            self.pids.append(pid)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //muserIcon.image = images[self.i] as? UIImage;
        
        var query2 = PFUser.query()
        var first = pids[self.i]
        query2!.whereKey("pid", equalTo: first)
        var objects = query2!.findObjects() as! [PFObject]
        var object = objects[0]
        var userName = object["username"] as? String
        var userRating = object["rating"] as? Float
        name = userName!
        rating = userRating
        if let thumbnail = object["profileImg"] as? PFFile {
            muserIcon.file = thumbnail
            muserIcon.loadInBackground()
        }

        nameCell.text = name
        ratingCell.text = String(stringInterpolationSegment: rating)

        var timer = NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        
        timeCell.numberOfLines = 2;
        timeCell.adjustsFontSizeToFitWidth = true
        timeCell.minimumScaleFactor = 0.1
        
        muserIcon.layer.cornerRadius = muserIcon.frame.size.width / 2;
        muserIcon.layer.borderWidth = 3.0
        muserIcon.clipsToBounds = true
        muserIcon.layer.borderColor = newColor
        
    }
    
    func update()
    {
        var query2 = PFUser.query()
        var ind = pids[self.i]
        query2!.whereKey("pid", equalTo: ind)
        var objects = query2!.findObjects() as! [PFObject]
        var object = objects[0]
        var userName = object["username"] as? String
        var userRating = object["rating"] as? Float
        name = userName!
        rating = userRating!
        if let thumbnail = object["profileImg"] as? PFFile {
            muserIcon.file = thumbnail
            muserIcon.loadInBackground()
        }
        nameCell.text = name
        ratingCell.text = String(stringInterpolationSegment: rating)

        self.i = self.i + 1;
        if (self.i > 1) {
            self.i = 0;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func setUsers(users : [User]) {
//        for user in users {
//            names.append(user.getUserName())
//            images.append(user.getPhoto())
//        }
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
