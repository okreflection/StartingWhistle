//
//  db.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 4/14/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

public class db: NSObject {
    
    var res = [[String]]()
    
    public func getPosts (cityName : String) -> [[String]] {
        
        var query = PFQuery(className:"GameSchedule")
        query.whereKey("city", equalTo:cityName)
        var objects = query.findObjects()
        for object in objects {
            var arr = [String]()
            var pid = object["pid"] as Int
            
            var query2 : PFQuery = PFUser.query()
            query2.whereKey("pid", equalTo: pid)
            var objects2 = query2.findObjects()
            
            println(objects2)
            arr.append(objects2[0]["firstName"] as String)
            arr.append(object["location"] as String)
            arr.append(object["startTime"] as String)
            arr.append(object["endTime"] as String)
            res.append(arr)
        }
        println("rescout")
        println(self.res.count)
        return self.res
    }
    
    public func signup(user : PFUser) -> Bool {
        
        var query : PFQuery = PFUser.query()
        query.orderByDescending("pid")
        var lastUser = query.getFirstObject()
        
        var pid : Int = lastUser["pid"] as Int
        pid = pid + 1
        
        user["pid"] = pid
        
//        user.signUpInBackgroundWithBlock {
//            (succeeded: Bool!, error: NSError!) -> Void in
//            if error == nil {
//                // Hooray! Let them use the app now.
//                self.dismissViewControllerAnimated(true, completion: nil)
//            } else {
//                println("signup failed")
//                // Show the errorString somewhere and let the user try again.
//            }
//        }

        
        var success = user.signUp()
        
        if (success) {
            return true
        }
        
        println("signup failed")
        return false
        

    }
    
    public func savePost(post : PFObject) -> Bool {
        return post.save()
    }
    
}
