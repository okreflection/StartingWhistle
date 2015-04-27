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

    @IBOutlet var tableview: UITableView!
    
    @IBOutlet weak var dayofweekLabel: UILabel!
    
    var datepicker = UIDatePicker()
    var timepicker = UIDatePicker()
    var timepicker2 = UIDatePicker()
    
    var mydb : db?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mydb = db()
        tableView.keyboardDismissMode = .OnDrag

        //setup datepicker
        datepicker.minimumDate = NSDate()
        datepicker.datePickerMode = UIDatePickerMode.Date
        datepicker.addTarget(self, action: Selector("datepickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        self.dateTextF.inputView = datepicker
        
        //setup timepicker
        timepicker.minimumDate = NSDate()
        timepicker.datePickerMode = UIDatePickerMode.Time
        timepicker.addTarget(self, action: Selector("timepickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        self.timeTextF.inputView = timepicker
        
        //setup datepicker2
        timepicker2.minimumDate = NSDate()
        timepicker2.datePickerMode = UIDatePickerMode.Time
        timepicker2.addTarget(self, action: Selector("timepicker2Changed:"), forControlEvents: UIControlEvents.ValueChanged)
        self.timeTextF2.inputView = timepicker2

    }
    
    @objc func datepickerChanged(datepicker:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .NoStyle
        
        var dateFormatter2 = NSDateFormatter()
        dateFormatter2.dateStyle = .FullStyle
        dateFormatter2.timeStyle = .NoStyle
        
        var strDate = dateFormatter.stringFromDate(datepicker.date)
        dateTextF.text = strDate
        
        var dayofweek = dateFormatter2.stringFromDate(datepicker.date)
        var myStringArr = dayofweek.componentsSeparatedByString(",")
        
        dayofweekLabel.text = myStringArr[0]
    }
    
    @objc func timepickerChanged(datepicker:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.timeStyle = .MediumStyle
        dateFormatter.dateStyle = .NoStyle
        
        var strDate = dateFormatter.stringFromDate(datepicker.date)
        timeTextF.text = strDate
    }
    
    @objc func timepicker2Changed(datepicker:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.timeStyle = .MediumStyle
        dateFormatter.dateStyle = .NoStyle
        
        var strDate = dateFormatter.stringFromDate(datepicker.date)
        timeTextF2.text = strDate
    }
    
    

    @IBAction func doneButton(sender: UIButton) {
        var city = "Beijing"
        var locStr = locTextF.text
        var dateStr = dateTextF.text
        var startTimeStr = timeTextF.text
        var endTimeStr = timeTextF2.text
        
        var user = PFUser.currentUser()
        var pid = user["pid"] as Int

        var object = PFObject(className:"GameSchedule")
        object.setObject(city, forKey: "city")
        object.setObject(locStr, forKey: "location")
        object.setObject(dateStr, forKey: "date")
        object.setObject(startTimeStr, forKey: "startTime")
        object.setObject(endTimeStr, forKey: "endTime")
        object.setObject(pid, forKey: "pid")
        mydb!.savePost(object)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
