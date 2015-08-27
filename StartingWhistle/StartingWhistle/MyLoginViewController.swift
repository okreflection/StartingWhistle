//
//  MyLoginViewController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 8/25/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

import Parse
import ParseUI

class MyLoginViewController: PFLogInViewController, PFLogInViewControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        let logoView = UIImageView(image: UIImage(named:"logo3.png"))
        self.logInView!.logo = logoView
    }
}
