//
//  weekNavigationView.swift
//  PencilBox
//
//  Created by gyp on 4/29/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit

protocol dateOffsetDelegate {
    func incrementWeek()
    func decrementWeek()
}

class weekNavigationView: UIView,dateOffsetDelegate {
    var dateSelectDelegate:barDateDelegate?
    var weekdayButtons:[UIButton]! = [UIButton(),UIButton(),UIButton(),UIButton(),UIButton(),UIButton(),UIButton()]
    var weekDateSubtitles:[UILabel]! = [UILabel(),UILabel(),UILabel(),UILabel(),UILabel(),UILabel(),UILabel()]
    var weekDates:[NSDate]! = [NSDate(),NSDate(),NSDate(),NSDate(),NSDate(),NSDate(),NSDate()]
    var weekdaySymbols = NSCalendar.currentCalendar().shortWeekdaySymbols
    var weekOffset:Int!{
        didSet{
            let calendar = NSCalendar.currentCalendar()
            for i in 0...6{
                weekDates[i]=calendar.dateByAddingUnit(.Day, value: i-weekDay+weekOffset*7, toDate: NSDate(), options: [])!
                let components = NSCalendar.currentCalendar().components([.Day,.Month], fromDate: weekDates[i])
                weekDateSubtitles[i].text = "\(components.month).\(components.day)"
            }
        }
    }
    var weekDay:Int! = NSCalendar.currentCalendar().components(.Weekday, fromDate: NSDate()).weekday-1
    var selectedWeekdayIdx:Int! = NSCalendar.currentCalendar().components(.Weekday, fromDate: NSDate()).weekday-1{
        didSet{
            if let _ = oldValue{
                weekdayButtons[oldValue].backgroundColor = UIColor(red: CGFloat(0.95), green: CGFloat(0.95), blue: CGFloat(0.95), alpha: CGFloat(1.0))
            }
            weekdayButtons[selectedWeekdayIdx].backgroundColor = UIColor.whiteColor()
            dateSelectDelegate?.feedbackResult(weekDates[selectedWeekdayIdx])
        }
    }
    
    init(){
        super.init(frame: CGRect(x:0,y:0,width:UIScreen.mainScreen().bounds.width,height: 64))
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        selectedWeekdayIdx = NSCalendar.currentCalendar().components(.Weekday, fromDate: NSDate()).weekday-1
        let w = UIScreen.mainScreen().bounds.width
        for i in 0...6{
            weekdayButtons[i].frame = CGRect(x: CGFloat(CGFloat(i) * w/7), y: 0, width: CGFloat(w/7), height: 64)
            weekdayButtons[i].setTitle(weekdaySymbols[i], forState: .Normal)
            print(weekdaySymbols[i])
            weekdayButtons[i].setTitleColor(UIColor.blueColor(), forState: .Normal)
            weekdayButtons[i].backgroundColor = UIColor(red: CGFloat(0.95), green: CGFloat(0.95), blue: CGFloat(0.95), alpha: CGFloat(1.0))
            weekdayButtons[i].tintColor=UIColor.whiteColor()
            weekdayButtons[i].addTarget(self, action: #selector(weekpressed(_:)), forControlEvents: .TouchUpInside)
            weekDateSubtitles[i] = UILabel(frame: CGRect(x: CGFloat(w/14-12),y: 42,width: 48,height: 12))
            weekDateSubtitles[i].textColor = UIColor.blueColor()
            weekDateSubtitles[i].backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
            weekDateSubtitles[i].font = UIFont(name: "Helvetica Neue", size: 12)!
            weekDateSubtitles[i].text = "5.13"
            weekdayButtons[i].addSubview(weekDateSubtitles[i])
            self.addSubview(weekdayButtons[i])
        }
        weekOffset=0
        weekdayButtons[selectedWeekdayIdx].backgroundColor=UIColor.whiteColor()
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
                selectedWeekdayIdx=0
            case "Mon":
                selectedWeekdayIdx=1
            case "Tue":
                selectedWeekdayIdx=2
            case "Wed":
                selectedWeekdayIdx=3
            case "Thu":
                selectedWeekdayIdx=4
            case "Fri":
                selectedWeekdayIdx=5
            case "Sat":
                selectedWeekdayIdx=6
            default:
                break
            }
        }
    }
    
    func incrementWeek() {
        weekOffset = weekOffset + 1
    }
    func decrementWeek() {
        weekOffset = weekOffset - 1
    }

}
