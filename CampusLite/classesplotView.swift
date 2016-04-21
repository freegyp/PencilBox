//
//  classesplotView.swift
//  PencilBox
//
//  Created by gyp on 4/18/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit

class classesplotView: UIView {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        if let context:CGContextRef = UIGraphicsGetCurrentContext(){
            CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
            CGContextSetAlpha(context, 1.0)
            CGContextFillRect(context, rect)
            CGContextSetLineWidth(context, 0.6)
            CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
            let verticalLines:Int = 6
            let horizontalLines:Int = 7
            for i in 0..<verticalLines{
                CGContextMoveToPoint(context, CGFloat(10+70*i), 200)
                CGContextAddLineToPoint(context, CGFloat(10+70*i), 440)
            }
            for i in 0..<horizontalLines{
                CGContextMoveToPoint(context, CGFloat(10), CGFloat(200+40*i))
                CGContextAddLineToPoint(context, CGFloat(360), CGFloat(200+40*i))
            }
            CGContextStrokePath(context)
        }
    }
    

}
