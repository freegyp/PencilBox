//
//  datePickViewController.swift
//  PencilBox
//
//  Created by gyp on 4/14/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit

class datePickViewController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    
    var delegate:datePickPopoverFeedback?

    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.locale = NSLocale.currentLocale()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        delegate?.feedbackResult(datePicker.date)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
