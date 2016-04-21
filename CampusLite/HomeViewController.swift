//
//  HomeViewController.swift
//  PencilBox
//
//  Created by gyp on 4/16/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var myClassButton: UIButton!
    @IBOutlet var myTwitsButton: UIButton!
    @IBOutlet var secondhandButton: UIButton!
    
    @IBOutlet var flashgamesButton: UIButton!
    @IBOutlet var scrollViewController: UIScrollView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myClassButton.backgroundColor = UIColor.blueColor()
        myClassButton.setTitle("My\nClasses", forState: .Normal)
        myClassButton.titleLabel?.textAlignment = NSTextAlignment.Center
        myClassButton.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        myClassButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        //myClassButton.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width/4, 100)
        myTwitsButton.backgroundColor = UIColor.greenColor()
        myTwitsButton.setTitle("My\nPosts", forState: .Normal)
        myTwitsButton.titleLabel?.textAlignment = NSTextAlignment.Center
        myTwitsButton.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        myTwitsButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        //myTwitsButton.frame = CGRectMake(UIScreen.mainScreen().bounds.width/4, 0, UIScreen.mainScreen().bounds.width/4, 100)
        secondhandButton.backgroundColor = UIColor.blueColor()
        secondhandButton.setTitle("Second\nHand", forState: .Normal)
        secondhandButton.titleLabel?.textAlignment = NSTextAlignment.Center
        secondhandButton.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        secondhandButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        //secondhandButton.frame = CGRectMake(UIScreen.mainScreen().bounds.width/2, 0, UIScreen.mainScreen().bounds.width/4, 100)
        flashgamesButton.backgroundColor = UIColor.greenColor()
        flashgamesButton.setTitle("Flash\nGames", forState: .Normal)
        flashgamesButton.titleLabel?.textAlignment = NSTextAlignment.Center
        flashgamesButton.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        flashgamesButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        //flashgamesButton.frame = CGRectMake(3*UIScreen.mainScreen().bounds.width/4, 0, UIScreen.mainScreen().bounds.width/4, 100)
        
        

        // Do any additional setup after loading the view.
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
