//
//  dayScheduleView.swift
//  PencilBox
//
//  Created by gyp on 4/13/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit

class dayScheduleView: UIView {
    var testButton:ScheduleEventButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(){
        self.init(frame: CGRectZero)
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        testButton = ScheduleEventButton()
        testButton!.setTitle("test", forState: .Normal)
        testButton!.setTitleColor(UIColor.blueColor(), forState: .Normal)
        testButton!.frame=CGRectMake(100, 70, 150, 180)
        testButton?.backgroundColor = UIColor(red: CGFloat(0.9), green: CGFloat(0.9), blue: CGFloat(0.9), alpha: CGFloat(1.0))
        self.addSubview(testButton!)
        if let context:CGContextRef? = UIGraphicsGetCurrentContext(){
            CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
            CGContextSetAlpha(context, 1.0)
            CGContextFillRect(context, rect)
            CGContextSetLineWidth(context, 0.6)
            CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .Center
            let attrs = [NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 12)!, NSParagraphStyleAttributeName: paragraphStyle]
            let numLines:Int = 17
            var text="08:00"
            for i in 0..<numLines{
                CGContextMoveToPoint(context, 50, CGFloat(i*60+10))
                CGContextAddLineToPoint(context, UIScreen.mainScreen().bounds.width, CGFloat(i*60+10))
            }
            CGContextStrokePath(context)
            for i in 0..<numLines{
                text="\(i+8):00"
                text.drawWithRect(CGRect(x:0,y:CGFloat(i*60+4),width:48,height:12),options: .UsesLineFragmentOrigin, attributes: attrs, context:nil)
            }
        }
        super.drawRect(rect)
    }
    
    
}
