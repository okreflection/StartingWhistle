//
//  BlurView.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 4/28/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class BlurView: UIView {
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
//        let blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
//        var effectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
//        effectView.frame = frame
//        addSubview(effectView)
    }
    
    override func drawRect(rect: CGRect) {
        updateLayerProperties()
    }
    
    func updateLayerProperties() {
        layer.masksToBounds = true
//        layer.cornerRadius = 8.0
        
        //superview is your optional embedding UIView
        if let superview = superview {
            superview.backgroundColor = UIColor.clearColor()
            superview.layer.shadowColor = UIColor.lightGrayColor().CGColor
            superview.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 8.0).CGPath
            superview.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            superview.layer.shadowOpacity = 1.0
//            superview.layer.shadowRadius = 2
            superview.layer.masksToBounds = true
            superview.clipsToBounds = false
        }
    }
    
    
    
}
