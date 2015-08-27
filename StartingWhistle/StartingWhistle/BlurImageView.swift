//
//  BlurImageView.swift
//  StartingWhistle
//
//  Created by Zixiang Zhu on 4/28/15.
//  Copyright (c) 2015 Zixiang Zhu. All rights reserved.
//

class BlurImageView: UIImageView {
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        let blur:UIBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var effectView:UIVisualEffectView = UIVisualEffectView (effect: blur)
        effectView.frame = frame
        addSubview(effectView)
    }
    
}
