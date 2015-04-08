//
//  ViewController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 3/31/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var currentUser = PFUser.currentUser()
        
        if (currentUser == nil) {
            var logInController = self.storyboard?.instantiateViewControllerWithIdentifier("Login") as MyLoginViewController
            
            self.presentViewController(logInController, animated:true, completion: nil)
            
        } else {
            println(currentUser.description)

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
    
    
    @IBAction func toFreeMode(sender: AnyObject) {
        let freePlayer = self.storyboard?.instantiateViewControllerWithIdentifier("FreePlayer") as FreePlayerControllerViewController
        self.navigationController?.pushViewController(freePlayer, animated: true)
    }
    
}

