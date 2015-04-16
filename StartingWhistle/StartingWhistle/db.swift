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
   
}
