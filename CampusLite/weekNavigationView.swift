//
//  weekNavigationView.swift
//  PencilBox
//
//  Created by gyp on 4/29/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit

class weekNavigationView: UIView {
    var weekdayButtons:[UIButton]! = [UIButton(),UIButton(),UIButton(),UIButton(),UIButton(),UIButton(),UIButton()]
    var weekdaySymbols = NSCalendar.currentCalendar().shortWeekdaySymbols
    private var wdSymbol:String!
    var weekdayIdx:Int! = NSCalendar.currentCalendar().components(.Weekday, fromDate: NSDate()).weekday-1{
        didSet{
            if let _ = oldValue{
                weekdayButtons[oldValue].backgroundColor = UIColor(red: CGFloat(0.95), green: CGFloat(0.95), blue: CGFloat(0.95), alpha: CGFloat(1.0))
            }
            weekdayButtons[weekdayIdx].backgroundColor = UIColor.whiteColor()
        }
    }
    
    init(){
        super.init(frame: CGRect(x:0,y:0,width:UIScreen.mainScreen().bounds.width,height: 64))
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let w = UIScreen.mainScreen().bounds.width
        for i in 0...6{
            weekdayButtons[i].frame = CGRect(x: CGFloat(CGFloat(i) * w/7), y: 0, width: CGFloat(w/7), height: 64)
            weekdayButtons[i].setTitle(weekdaySymbols[i], forState: .Normal)
            print(weekdaySymbols[i])
            weekdayButtons[i].setTitleColor(UIColor.blueColor(), forState: .Normal)
            weekdayButtons[i].backgroundColor = UIColor(red: CGFloat(0.95), green: CGFloat(0.95), blue: CGFloat(0.95), alpha: CGFloat(1.0))
            weekdayButtons[i].tintColor=UIColor.whiteColor()
            weekdayButtons[i].addTarget(self, action: #selector(weekpressed(_:)), forControlEvents: .TouchUpInside)
            self.addSubview(weekdayButtons[i])
        }
        weekdayIdx = NSCalendar.currentCalendar().components(.Weekday, fromDate: NSDate()).weekday-1
        weekdayButtons[weekdayIdx].backgroundColor=UIColor.whiteColor()
        //print(weekdayIdx)
        //self.setNeedsDisplay()
    }
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    
    func weekpressed(sender: UIButton!){
        if let title = sender.currentTitle{
            switch title {
            case "Sun":
                weekdayIdx=0
            case "Mon":
                weekdayIdx=1
            case "Tue":
                weekdayIdx=2
            case "Wed":
                weekdayIdx=3
            case "Thu":
                weekdayIdx=4
            case "Fri":
                weekdayIdx=5
            case "Sat":
                weekdayIdx=6
            default:
                break
            }
        }
    }
    

}
