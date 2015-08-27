//
//  Game.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 5/11/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class Game: NSObject {
    
    private var loc : String
    private var startTime : String
    private var endTime : String
    private var date : String
    private var users : [User]
    private var pids : [Int]
    private var latitude : Double
    private var longitude : Double
    private var address : String
    
    override init() {
        loc = ""
        startTime = ""
        endTime = ""
        date = ""
        users = [User]()
        pids = [Int]()
        latitude = 39.9167
        longitude = 116.3833
        address = ""
    }
    
    
//    game.setLoc(object["location"] as String)
//    game.setStart(object["startTime"] as String)
//    game.setEnd(object["endTime"] as String)
//    game.setDate(object["date"] as String)

    func setLoc (loc : String, lat:Double, long:Double, addr : String) {
        self.loc = loc
        self.latitude = lat
        self.longitude = long
        self.address = addr
    }
    
    func setStart (start : String) {
        self.startTime = start
    }
    
    func setEnd (end : String) {
        self.endTime = end
    }
    
    func setPids (pids : [Int]) {
        self.pids = pids
    }
    
    func setDate (date : String) {
        self.date = date
    }
    
    func setUsers (userList : [User]) {
        users = userList
    }
    
    func getLoc() -> String {
        return self.loc
    }
    
    func getDate() -> String {
        return self.date
    }
    
    func getTime() -> String {
        return self.startTime + " - " + self.endTime
    }
    
    func getStartTime() -> String {
        return self.startTime
    }
    
    func getUsers() -> [User] {
        return users
    }
    
    func getPids() -> [Int] {
        return self.pids
    }
    
    func getLatitude() -> Double {
        return self.latitude
    }
    
    func getLongitude() -> Double {
        return self.longitude
    }
    
    func getAddr() -> String {
        return self.address
    }
    
   
}
