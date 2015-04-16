//
//  ColViewCellControllerCollectionViewCell.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 4/4/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

import UIKit

class ColViewCellController: UICollectionViewCell {
    
    @IBOutlet weak var labelCell: UILabel!
    @IBOutlet weak var nameCell: UILabel!
    
    @IBOutlet weak var locCell: UILabel!
    
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var timeCell: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.timeCell.numberOfLines = 2;
        self.timeCell.minimumScaleFactor = 0.1;
        self.timeCell.adjustsFontSizeToFitWidth = true;
        self.timeCell.backgroundColor = UIColor.redColor()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
