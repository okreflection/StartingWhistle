//
//  MyLoginViewController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 4/7/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class MyLoginViewController: UIViewController {
    
    @IBOutlet weak var userNameField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    @IBAction func gotoSignupFired(sender: AnyObject) {
        
        var signUpController = self.storyboard?.instantiateViewControllerWithIdentifier("Signup") as MySignupViewController
        
        self.presentViewController(signUpController, animated:true, completion: nil)
        
    }
    
    @IBAction func loginFired(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(userNameField.text, password: passwordField.text) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                println("login failed")
            }
        }
        
    }
    
}
