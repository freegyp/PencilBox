//
//  houseFilterViewController.swift
//  CampusLite
//
//  Created by gyp on 4/10/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit



class houseFilterViewController: UITableViewController {
    
    private var rowIds:[String]=["leasing","hostel","all"]
    private var rowTitles:[String]=["Leasing Only","Hostel Only","All Houses"]
    private var itemSelected:[Bool]=[false,false,true]
    var delegate:filterPopoverResultDelegate?
    
    var selectedIdx:Int=2{
        didSet{
            itemSelected[oldValue]=false
            itemSelected[selectedIdx]=true
            switch selectedIdx {
            case 0:
                delegate?.feedbackResult(.Leasing)
            case 1:
                delegate?.feedbackResult(.Hostel)
            case 2:
                delegate?.feedbackResult(.All)
            default:
                break
            }
        }
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


    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "leasing")
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "hostel")
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "all")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
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

        // Configure the cell...

        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIdx=indexPath.row
        self.dismissViewControllerAnimated(false, completion: {})
    }

}
