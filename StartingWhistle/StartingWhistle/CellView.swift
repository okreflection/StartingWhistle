//
//  CellView.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 4/27/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class CellView: UIView {

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override func drawRect(rect: CGRect) {
        updateLayerProperties()
    }
    
    func updateLayerProperties() {
        layer.masksToBounds = true
        layer.cornerRadius = 8.0
        
        //superview is your optional embedding UIView
        if let superview = superview {
            superview.backgroundColor = UIColor.clearColor()
            superview.layer.shadowColor = UIColor.darkGrayColor().CGColor
            superview.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 8.0).CGPath
            superview.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
            superview.layer.shadowOpacity = 1.0
            superview.layer.shadowRadius = 2
            superview.layer.masksToBounds = true
            superview.clipsToBounds = false
        }
    }

}
