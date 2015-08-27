//
//  ViewController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 3/31/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    var loginController = MyLoginViewController()
    var signupController = MySignupViewController()
    var configureController = ConfigureViewController();
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var pfcurrentUser = PFUser.currentUser()
        if (pfcurrentUser == nil) {
            loginController.delegate = self
            signupController.delegate = self
            loginController.signUpController = signupController
            presentViewController(loginController, animated:true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewControllerDidCancelLogIn(controller: PFLogInViewController) -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            var vc = self.storyboard?.instantiateViewControllerWithIdentifier("Configure") as! ConfigureViewController
            self.presentViewController(vc, animated: true, completion: nil)
        })
    }
    
    @IBAction func toFreeMode(sender: AnyObject) {
        let freePlayer = self.storyboard?.instantiateViewControllerWithIdentifier("FreePlayer") as! FreePlayerControllerViewController
        self.navigationController?.pushViewController(freePlayer, animated: true)
    }
}

