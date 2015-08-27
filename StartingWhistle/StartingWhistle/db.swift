//
//  db.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 4/14/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

public class db: NSObject {
    func getGames (cityName: String) -> [Game] {
        var ret = [Game]()
        var pids = [Int]()
        var users = [User]()
        var query = PFQuery(className:"GameSchedule")
        query.whereKey("city", equalTo:cityName)
        var objects = query.findObjects() as! [PFObject]
        for object in objects {
            var game = Game()
            game.setLoc(object["location"] as! String, lat: object["latitude"] as! Double, long: object["longitude"] as! Double, addr:object["address"] as! String)
            game.setStart(object["startTime"]as! String)
            game.setEnd(object["endTime"]as! String)
            game.setDate(object["date"]as! String)
            
            //get info for each user in the game
            pids = object["pids"] as! [Int]
            game.setPids(pids)
            
            ret.append(game)
        }
        
        println("retcout")
        println(ret.count)
       
        return ret
    }
    
    func signup(user : PFUser) -> Bool {
        
        var query : PFQuery = PFUser.query()!
        
        if query.countObjects() == 0 {
            user["pid"] = 0
            
        } else {
            query.orderByDescending("pid")
            var lastUser = query.getFirstObject()!
            var s_pid = lastUser["pid"] as! String
            var pid_raw = s_pid.toInt()
            var pid = pid_raw! + 1
            user["pid"] = pid
        }

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
