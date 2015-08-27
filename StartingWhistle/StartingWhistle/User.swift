//
//  User.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 5/7/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit


/*
* a monostate class that represent other player in a game
* cannot save
*/
class User: NSObject {
    
//    class var sharedInstance: User {
//        
//        struct Static {
//            static var instance : User?
//            static var token: dispatch_once_t = 0
//        }
//        
//        dispatch_once(&Static.token) {
//            Static.instance = User()
//        }
//        
//        return Static.instance!
//        
//    }
    
    private var user : PFUser
    
    private var userName : String
    
    private var password : String
    
    private var skillLevel : String
    
    private var dob : String
    
    private var firstName: String
    
    private var lastName : String
    
    private var city : String
    
    private var rating : Float
    
    private var photo : UIImage!
    
    var mydb : db?
    
    override init() {
        user = PFUser()
        mydb = db()
        userName = ""
        password = ""
        skillLevel = ""
        dob = ""
        firstName = ""
        lastName =  ""
        city = ""
        rating = 5.0
        photo = UIImage(named: "jersey.jpg")!
        
    }
    
    func setUserName(un : String) {
        userName = un
    }
    
    func setPassword(pw : String) {
        password = pw
    }
    
    func setSkillLevel(sl : String) {
        skillLevel = sl
    }
    
    func setDob(dob : String) {
        self.dob = dob
    }
    
    func setFirstName(fn : String) {
        firstName = fn
    }
    
    func setLastName(ln : String) {
        lastName = ln
    }
    
    func setPhoto(img : UIImage) {
        self.photo = img
    }
    
    func setCity(city : String) {
        self.city = city
    }
    
    func setRating(rating : Float) {
        self.rating = rating
    }
    
    func getUserName() -> String {
        return self.userName
    }
    
    func getPhoto() -> UIImage {
        return self.photo
    }
    
    func getRating() -> Float {
        return self.rating
    }
    
    

}
