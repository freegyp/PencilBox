//
//  SecondViewController.swift
//  CampusLite
//
//  Created by gyp on 4/9/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit

protocol datePickPopoverFeedback {
    func feedbackResult(date:NSDate)
}

class SecondViewController: UIViewController,UIPopoverPresentationControllerDelegate,datePickPopoverFeedback {
    @IBOutlet var weeknavView: weekNavigationView!
    
    @IBOutlet var titleBar: UINavigationItem!
    
    @IBOutlet var scrollView: UIScrollView!
    var dateFormatter:NSDateFormatter = NSDateFormatter()
    var scheduleView:dayScheduleView?
    var titleDate:NSDate = NSDate(){
        didSet{
            titleBar.title=dateFormatter.stringFromDate(titleDate)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weeknavView.weekOffset = 0
        let calendar = NSCalendar.currentCalendar()
        let twoDaysAgo = calendar.dateByAddingUnit(.Day, value: -2, toDate: NSDate(), options: [])
        print(twoDaysAgo)
        dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        dateFormatter.locale = NSLocale.currentLocale()
        titleDate=NSDate()
        scheduleView = dayScheduleView(frame: CGRect(x:0,y:0,width: UIScreen.mainScreen().bounds.width,height: 980))
        scrollView.addSubview(scheduleView!)
        scrollView.contentSize=CGSize(width: UIScreen.mainScreen().bounds.width,height: 980)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier=segue.identifier{
            switch identifier {
            case "selectDatePopover":
                if let vc = segue.destinationViewController as? datePickViewController{
                    if let ppc=vc.popoverPresentationController{
                        ppc.permittedArrowDirections=UIPopoverArrowDirection.Any
                        ppc.delegate=self
                        vc.delegate=self
                    }
                }
            default:
                break
            }
        }
    }

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    func feedbackResult(date: NSDate) {
        titleDate=date
    }

}

