//
//  FirstViewController.swift
//  CampusLite
//
//  Created by gyp on 4/9/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit

enum HousingType{
    case Leasing
    case Hostel
    case All
}

protocol filterPopoverResultDelegate:class {
    func feedbackResult(res:HousingType)
}

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPopoverPresentationControllerDelegate,filterPopoverResultDelegate {
    @IBOutlet var titleBar: UINavigationItem!
    @IBOutlet var housinglistTBView: UITableView!
    var datalist:[AnyObject]!=[]
    var housingType:HousingType = .All{
        didSet{
            switch housingType {
            case .Leasing:
                titleBar.title="Leasing"
            case .Hostel:
                titleBar.title="Hostel"
            case .All:
                titleBar.title="All"
            default:
                break
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier=segue.identifier{
            switch identifier {
            case "filterPopover":
                if let vc=segue.destinationViewController as? houseFilterViewController{
                    if let ppc=vc.popoverPresentationController{
                        ppc.permittedArrowDirections=UIPopoverArrowDirection.Any
                        ppc.delegate=self
                        vc.delegate=self
                        switch housingType {
                        case .Leasing:
                            vc.selectedIdx=0
                        case .Hostel:
                            vc.selectedIdx=1
                        case .All:
                            vc.selectedIdx=2
                        default:
                            break
                        }
                    }
                }
            default:
                break
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        housingType = .All
        self.housinglistTBView.delegate=self
        self.housinglistTBView.dataSource=self
        if let testdata:NSData = NSData(contentsOfURL: NSURL(string: "https://gypgae3.appspot.com/_ah/api/housing/v1/houses")!){
            //print("\(testdata)")
            do{
                var jsonobj:AnyObject = try NSJSONSerialization.JSONObjectWithData(testdata, options: NSJSONReadingOptions.MutableContainers)
                if let l = jsonobj["items"] as? [AnyObject]{
                    datalist=l
                    //print(l[0])
                }
            }catch _{
                print("error parsing json data")
            }
        }
        //self.housinglistTBView.registerClass(housingTableViewCell.self, forCellReuseIdentifier: "house cell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    func feedbackResult(res: HousingType) {
        housingType=res
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:housingTableViewCell=self.housinglistTBView.dequeueReusableCellWithIdentifier("housecell", forIndexPath: indexPath) as! housingTableViewCell
        print(datalist[indexPath.row])
        if let name = datalist[indexPath.row]["posterName"] as? String{
            cell.posterName = name
        }
        if let distance = datalist[indexPath.row]["distance"] as? Float{
            cell.distanceInfo = distance
        }
        if let type = datalist[indexPath.row]["houseType"] as? String{
            if let t = Int(type){
                switch t {
                case 0:
                    cell.isHostel=false
                case 1:
                    cell.isHostel=true
                default:
                    break
                }
            }
        }
        if let price = datalist[indexPath.row]["price"] as? Float{
            cell.priceInfo = price
        }
        if let beds = datalist[indexPath.row]["bedrooms"] as? String{
            if let baths = datalist[indexPath.row]["bathrooms"] as? String{
                if let b1 = Int(beds){
                    if let b2 = Int(baths){
                        cell.roomsInfo = (b1,b2)
                    }
                }
            }
        }
        if let features = datalist[indexPath.row]["features"] as? [AnyObject]{
            var fl:[String]=[]
            for i in features{
                if let s = i["feature"] as? String{
                    fl.append(s)
                }
            }
            cell.featureList = fl
        }
        else{
            cell.featureList = []
        }
        return cell
    }
}

