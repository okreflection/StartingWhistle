//
//  CreateGameController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 4/4/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class CreateGameController: UITableViewController, UITextFieldDelegate {
    
    var popDatePicker: PopDatePicker?
    var popTimePicker: PopDatePicker?
    var popTimePicker2: PopDatePicker?
    
    @IBOutlet weak var locTextF: UITextField!
    
    @IBOutlet weak var timeTextF: UITextField!
    
    @IBOutlet weak var timeTextF2: UITextField!
    
    @IBOutlet weak var dateTextF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        popDatePicker = PopDatePicker(forTextField: dateTextF, type: "1")
        dateTextF.delegate = self
        
        popTimePicker = PopDatePicker(forTextField: timeTextF, type: "2")
        timeTextF.delegate = self
        
        popTimePicker2 = PopDatePicker(forTextField: timeTextF2, type: "2")
        timeTextF2.delegate = self

    }
    
    func resign() {
        dateTextF.resignFirstResponder()
        timeTextF.resignFirstResponder()
        timeTextF2.resignFirstResponder()
        
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        if (textField === dateTextF) {
            resign()
            let formatter = NSDateFormatter()
            formatter.dateStyle = .MediumStyle
            formatter.timeStyle = .NoStyle
            let initDate = formatter.dateFromString(dateTextF.text)
            
            popDatePicker!.pick(self, initDate:initDate, dataChanged: { (newDate : NSDate, forTextField : UITextField) -> () in
                
                // here we don't use self (no retain cycle)
                forTextField.text = newDate.ToDateMediumString("1")
                
            })
            return false
        } else if (textField == timeTextF) {
            
            resign()
            let formatter = NSDateFormatter()
            formatter.dateStyle = .NoStyle
            formatter.timeStyle = .MediumStyle
            let initDate = formatter.dateFromString(timeTextF.text)
            
            popTimePicker!.pick(self, initDate:initDate, dataChanged: { (newDate : NSDate, forTextField : UITextField) -> () in
                
                // here we don't use self (no retain cycle)
                forTextField.text = newDate.ToDateMediumString("2")
                
            })
            return false
            
        } else if (textField == timeTextF2) {
            
            resign()
            let formatter = NSDateFormatter()
            formatter.dateStyle = .NoStyle
            formatter.timeStyle = .MediumStyle
            let initDate = formatter.dateFromString(timeTextF2.text)
            
            popTimePicker2!.pick(self, initDate:initDate, dataChanged: { (newDate : NSDate, forTextField : UITextField) -> () in
                
                // here we don't use self (no retain cycle)
                forTextField.text = newDate.ToDateMediumString("2")
                
            })
            return false
            
        } else {
            return true
        }
    }

    @IBAction func doneButton(sender: UIButton) {
        var city = "Beijing"
        var locStr = locTextF.text
        var dateStr = dateTextF.text
        var startTimeStr = timeTextF.text
        var endTimeStr = timeTextF2.text

        var object = PFObject(className:"GameSchedule")
        object.setObject(city, forKey: "city")
        object.setObject(locStr, forKey: "location")
        object.setObject(dateStr, forKey: "date")
        object.setObject(startTimeStr, forKey: "startTime")
        object.setObject(endTimeStr, forKey: "endTime")
        object.save()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
