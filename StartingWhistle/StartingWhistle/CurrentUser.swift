//
//  CurrentUser.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 5/20/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

/*
* a singleton class that represents the signed in user or the new user
* have save() method
*/

class CurrentUser: NSObject {
    class var sharedInstance: CurrentUser {
        struct Static {
            static var instance : CurrentUser?
            static var token: dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            Static.instance = CurrentUser()
        }
        return Static.instance!
    
    }

    private var userName : String
    
    private var password : String
    
    private var skillLevel : String
    
    private var dob : String
    
    private var firstName: String
    
    private var lastName : String
    
    private var city : String
    
    private var rating : Float
    
    private var photo : UIImage!
    
    private var pid : Int!
    
    var mydb : db?
    
    override init() {
        userName = ""
        password = ""
        skillLevel = ""
        dob = ""
        firstName = ""
        lastName =  ""
        city = ""
        rating = 5.0
        photo = UIImage(named: "jersey.jpg")!
        pid = -1;
        
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
    
    func setPid(pid : Int) {
        self.pid = pid
    }
    
    func saveUser() {
        //let userImageFile = self.photo as PFFile
        
        let imageData = UIImagePNGRepresentation(self.photo)
        
        let userImageFile:PFFile = PFFile(data: imageData)
        
        //try to do sign up
        let params = [
            "password": password,
            "username": userName,
            "firstName": firstName,
            "lastName": lastName,
            "city": city,
            "birthday": dob,
            "skillLevel": skillLevel,
            "rating": rating,
        ]
        
        PFCloud.callFunctionInBackground("signup", withParameters: params as [NSObject : AnyObject]) {
            (response: AnyObject?, error: NSError?) -> Void in
            if error == nil {
                println(response);
            } else {
                println("server error")
            }
        }

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
    
    func getPid() -> Int {
        return self.pid
    }
    
    func getCity() -> String {
        return self.city
    }
   
}
