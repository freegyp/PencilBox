//
//  shopFilterViewController.swift
//  PencilBox
//
//  Created by gyp on 4/16/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit

class shopFilterViewController: UITableViewController {
    private var rowIds:[String]=["HomeDrive","HomeBus","TravelDrive","TravelBus"]
    private var rowTitles:[String]=["Driving From Home","Public Transport From Home","Driving From Travel Destination","Travel Destination Public Transport"]
    private var itemSelected:[Bool]=[true,false,false,false]
    var delegate:TrafficMethodPopoverFeedback?
    
    var selectedIdx:Int = 0{
        didSet{
            itemSelected[oldValue]=false
            itemSelected[selectedIdx]=true
            switch selectedIdx {
            case 0:
                delegate?.feedbackResult(.DriveHome)
            case 1:
                delegate?.feedbackResult(.PubtransHome)
            case 2:
                delegate?.feedbackResult(.DriveTravel)
            case 3:
                delegate?.feedbackResult(.PubtransTravel)
            default:
                break
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<4{
            self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: rowIds[i])
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override var preferredContentSize: CGSize{
        get{
            if self.tableView != nil && presentingViewController != nil{
                return self.tableView.sizeThatFits(presentingViewController!.view.bounds.size)
            }else{
                return super.preferredContentSize
            }
        }
        set{
            super.preferredContentSize=newValue
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(rowIds[indexPath.row])! as! UITableViewCell
        
        cell.textLabel?.text=rowTitles[indexPath.row]
        
        if itemSelected[indexPath.row]{
            cell.accessoryType=UITableViewCellAccessoryType.Checkmark
        }
        else{
            cell.accessoryType=UITableViewCellAccessoryType.None
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIdx=indexPath.row
        self.dismissViewControllerAnimated(false, completion: {})
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
