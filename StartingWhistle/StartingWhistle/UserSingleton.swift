//
//  UserSingleton.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 5/20/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

/*
* a singleton class that represents a player selected (not the signed in user)
*/

class UserSingleton: NSObject {
    
    private var user : User
    
    class var sharedInstance: UserSingleton {
        
        struct Static {
            static var instance : UserSingleton?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = UserSingleton()
        }
        
        return Static.instance!
    }
    
    override init() {
        user = User()
    }
    
    func setUser(usr : User) {
        self.user = usr
    }
    
    func getUser() -> User {
        return self.user
    }

   
}
