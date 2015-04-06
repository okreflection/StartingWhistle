//
//  PopTimePicker.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 4/6/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//


import UIKit

public class PopTimePicker : NSObject, UIPopoverPresentationControllerDelegate, DataPickerViewControllerDelegate {
    
    public typealias PopDatePickerCallback = (newDate : NSDate, forTextField : UITextField)->()
    
    var timePickerVC : PopTimeViewController
    var popover : UIPopoverPresentationController?
    var textField : UITextField!
    var dataChanged : PopDatePickerCallback?
    var presented = false
    var offset : CGFloat = 8.0
    
    public init(forTextField: UITextField) {
        
        timePickerVC = PopTimeViewController()
        self.textField = forTextField
        super.init()
    }
    
    public func pick(inViewController : UIViewController, initDate : NSDate?, dataChanged : PopDatePickerCallback) {
        
        if presented {
            return  // we are busy
        }
        
        timePickerVC.delegate = self
        timePickerVC.modalPresentationStyle = UIModalPresentationStyle.Popover
        timePickerVC.preferredContentSize = CGSizeMake(500,208)
        timePickerVC.currentTime = initDate
        
        popover = timePickerVC.popoverPresentationController
        if let _popover = popover {
            
            _popover.sourceView = textField
            _popover.sourceRect = CGRectMake(self.offset,textField.bounds.size.height,0,0)
            _popover.delegate = self
            self.dataChanged = dataChanged
            inViewController.presentViewController(datePickerVC, animated: true, completion: nil)
            presented = true
        }
    }
    
    func adaptivePresentationStyleForPresentationController(PC: UIPresentationController!) -> UIModalPresentationStyle {
        
        return .None
    }
    
    func timePickerVCDismissed(date : NSDate?) {
        
        if let _dataChanged = dataChanged {
            
            if let _time = time {
                
                _dataChanged(newTime: _time, forTextField: textField)
                
            }
        }
        presented = false
    }
}

