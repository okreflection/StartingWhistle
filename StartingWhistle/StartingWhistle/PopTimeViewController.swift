//
//  PopTimeViewController.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 4/6/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

protocol DataPickerViewControllerDelegate : class {
    
    func timePickerVCDismissed(date : NSDate?)
}

class PopTimeViewController : UIViewController {
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var timePicker: UIDatePicker!
    weak var delegate : DataPickerViewControllerDelegate?
    
    _timePicker.datePickerMode = UIDatePickerMode.Time
    
    var currentTime : NSDate? {
        didSet {
            updatePickerCurrentTime()
        }
    }
    
    override convenience init() {
        
        self.init(nibName: "PopTimeViewController", bundle: nil)
    }
    
    private func updatePickerCurrentTime() {
        
        if let _currentTime = self.currentDate {
            if let _timePicker = self.timePicker {
                _timePicker.time = _currentTime
            }
        }
    }
    
    @IBAction func okAction(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true) {
            
            let nsdate = self.timePicker.date
            self.delegate?.timePickerVCDismissed(nsdate)
            
        }
    }
    
    override func viewDidLoad() {
        
        updatePickerCurrentTime()
    }
    
    override func viewDidDisappear(animated: Bool) {
        
        self.delegate?.timePickerVCDismissed(nil)
    }
}

