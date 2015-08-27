//
//  ProfileViewController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 4/6/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var dateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutFired(sender: AnyObject) {
        PFUser.logOut()
        let mainPage = self.storyboard?.instantiateViewControllerWithIdentifier("Home") as! ViewController
        self.navigationController?.pushViewController(mainPage, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
