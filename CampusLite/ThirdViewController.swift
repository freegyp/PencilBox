//
//  ThirdViewController.swift
//  PencilBox
//
//  Created by gyp on 4/14/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit

enum TrafficMethod{
    case DriveHome
    case PubtransHome
    case DriveTravel
    case PubtransTravel
}

protocol TrafficMethodPopoverFeedback {
    func feedbackResult(result:TrafficMethod)
}

class ThirdViewController: UIViewController,UIPopoverPresentationControllerDelegate,TrafficMethodPopoverFeedback {
    @IBOutlet var statusBarItem: UINavigationItem!
    
    var trafficMethod:TrafficMethod = .DriveHome{
        didSet{
            switch trafficMethod {
            case .DriveHome:
                statusBarItem.title = "Driving From Home"
            case .PubtransHome:
                statusBarItem.title = "Public Transport From Home"
            case .DriveTravel:
                statusBarItem.title = "Driving From Travel Destination"
            case .PubtransTravel:
                statusBarItem.title = "Travel Destination Bus Routes"
            default:
                break
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        trafficMethod = .DriveHome

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier{
            switch identifier {
            case "shopFilterPopover":
                if let vc = segue.destinationViewController as? shopFilterViewController{
                    if let ppc = vc.popoverPresentationController{
                        ppc.permittedArrowDirections=UIPopoverArrowDirection.Any
                        ppc.delegate=self
                        vc.delegate = self
                        switch trafficMethod {
                        case .DriveHome:
                            vc.selectedIdx=0
                        case .PubtransHome:
                            vc.selectedIdx=1
                        case .DriveTravel:
                            vc.selectedIdx=2
                        case .PubtransTravel:
                            vc.selectedIdx=3
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
    
    func feedbackResult(result: TrafficMethod) {
        trafficMethod = result
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }

}
