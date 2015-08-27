//
//  FindGameViewController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 5/19/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class FindGameViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var addressButton: UIButton!
   
    @IBOutlet weak var dateField: UITextField!
    
    @IBOutlet weak var startField: UITextField!
    
    @IBOutlet weak var endField: UITextField!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    var datepicker = UIDatePicker()
    var activeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activeField = endField
        scrollView.keyboardDismissMode = .OnDrag
        
        //setup date picker view
        datepicker.maximumDate = NSDate()
        datepicker.datePickerMode = UIDatePickerMode.Date
        self.dateField.inputView = datepicker
        datepicker.addTarget(self, action: Selector("datepickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        //setup observer
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardDidShow:"), name: UIKeyboardDidShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillBeHidden:"), name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
        if let cityName = PFUser.currentUser()!["city"] as? String {
            cityLabel.text = cityName
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.activeField = textField
        println(activeField.text)
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
            println(activeField.text)
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
        dateField.text = strDate
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    @IBAction func changeCityFired(sender: AnyObject) {
    }
    
    
    @IBAction func searchFired(sender: AnyObject) {
    }
    
    
    @IBAction func addressButtonFired(sender: AnyObject) {
        let addressmapview = self.storyboard?.instantiateViewControllerWithIdentifier("AddressMapViewController") as! AddressMapViewController
        self.navigationController?.pushViewController(addressmapview, animated: true)
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
