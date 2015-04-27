//
//  ColViewCellControllerCollectionViewCell.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 4/4/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class ColViewCellController: UICollectionViewCell {
    
    @IBOutlet weak var bgImg: UIImageView!
    
    
    @IBOutlet weak var muserIcon: UIImageView!
    
    @IBOutlet weak var playerIcon: UIImageView!
    
    @IBOutlet weak var locCell: UILabel!
    
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var timeCell: UILabel!
    
    var newColor = UIColor.whiteColor().CGColor

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.muserIcon.frame = CGRectMake(0, 0, 100, 100)
        
        self.muserIcon.layer.borderWidth = 3.0
        
        self.muserIcon.layer.borderColor = newColor
        
        self.timeCell.numberOfLines = 2;
        self.timeCell.minimumScaleFactor = 0.1;
        self.timeCell.adjustsFontSizeToFitWidth = true;
        self.timeCell.backgroundColor = UIColor.redColor()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
