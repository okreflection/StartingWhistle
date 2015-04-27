//
//  MySignupViewController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 4/7/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class MySignupViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var cityField: UITextField!
    
    @IBOutlet weak var birthdayField: UITextField!
    
    @IBOutlet weak var skillField: UITextField!
    
    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var passwordField2: UITextField!
    
    var activeField: UITextField!
    
    let skillLevelData: [String] = ["Beginner", "Amateur", "Semi-Pro", "Professional", "World Class"]
    
    var picker = UIPickerView()
    var datepicker = UIDatePicker()
    
    var mydb : db?
    
    var popDatePicker: PopDatePicker?

    override func viewDidLoad() {
        super.viewDidLoad()

        mydb = db()
        scrollView.keyboardDismissMode = .OnDrag
        activeField = passwordField
        
        //setup picker view
        picker.dataSource = self
        picker.delegate = self
        picker.showsSelectionIndicator = true
        self.skillField.inputView = picker
        
        //setup date picker view
        datepicker.maximumDate = NSDate()
        datepicker.datePickerMode = UIDatePickerMode.Date
        self.birthdayField.inputView = datepicker
        datepicker.addTarget(self, action: Selector("datepickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        //setup observer
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardDidShow:"), name: UIKeyboardDidShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillBeHidden:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.activeField = textField
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.activeField = nil
    }

    @objc func keyboardDidShow(aNotification : NSNotification) {
        var info: NSDictionary = aNotification.userInfo!
        var kbSize: CGSize = info.objectForKey(UIKeyboardFrameBeginUserInfoKey)!.CGRectValue().size
        var contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect: CGRect = self.view.frame
        aRect.size.height -= kbSize.height
        if (!CGRectContainsPoint(aRect, activeField.frame.origin)) {
            self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
        }
    }
    
    @objc func keyboardWillBeHidden(aNotification: NSNotification) {
        var contentInsets: UIEdgeInsets = UIEdgeInsetsZero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func datepickerChanged(datepicker:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle

        var strDate = dateFormatter.stringFromDate(datepicker.date)
        birthdayField.text = strDate
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return skillLevelData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return skillLevelData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.skillField.text = skillLevelData[row]
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func cancelFired(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func signupFired(sender: AnyObject) {
        
        var user = PFUser()
        user.username = userNameField.text
        user.password = passwordField.text
        //user.email = "email@example.com"
        
        user["firstName"] = firstNameField.text
        user["lastame"] = lastNameField.text
        user["city"] = cityField.text
        user["birthday"] = birthdayField.text
        user["skillLevel"] = skillField.text
        
        if (mydb!.signup(user)) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        
    }
}
