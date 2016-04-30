//
//  ScheduleEventButton.swift
//  PencilBox
//
//  Created by gyp on 4/29/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit

class ScheduleEventButton: UIButton {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        self.setTitle("test", forState: .Normal)
        self.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.frame=CGRectMake(100, 70, 150, 180)
        self.backgroundColor = UIColor(red: CGFloat(0.9), green: CGFloat(0.9), blue: CGFloat(0.9), alpha: CGFloat(1.0))
    }
    

}
