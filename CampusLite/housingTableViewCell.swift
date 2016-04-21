//
//  housingTableViewCell.swift
//  CampusLite
//
//  Created by gyp on 4/11/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit

class housingTableViewCell: UITableViewCell {
    @IBOutlet var houseIconView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var roomsLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var featureTextView: UITextView!
    
    var isHostel:Bool=false{
        didSet{
            var image : UIImage = UIImage(named: "seanau_3d_house_home-0")!
            if isHostel{
                image=UIImage(named: "hotel")!
            }
            houseIconView.image=image
        }
    }
    
    var posterName:String = "John Doe"{
        didSet{
            nameLabel.text = posterName
        }
    }
    
    var roomsInfo:(Int,Int) = (3,1){
        didSet{
            roomsLabel.text="\(roomsInfo.0) Beds, \(roomsInfo.1) Baths"
        }
    }
    
    var priceInfo:Float = 999.99{
        didSet{
            priceLabel.text="$\(priceInfo)"
        }
    }
    
    var distanceInfo:Float = 1.00{
        didSet{
            if !self.isHostel{
                distanceLabel.text="\(distanceInfo) mile"
            }
            else{
                distanceLabel.text="N/A"
            }
        }
    }
    
    var featureList:[String]=["Utilities Included"]{
        didSet{
            featureTextView.text=""
            for i in featureList{
                featureTextView.text.appendContentsOf(i)
                featureTextView.text.append(Character("\n"))
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
