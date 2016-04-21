//
//  rootViewController.swift
//  PencilBox
//
//  Created by gyp on 4/12/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit

class rootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if (UIDevice.currentDevice().systemVersion as NSString).floatValue >= 7{
            for tbi in self.tabBar.items!{
                tbi.image=tbi.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
