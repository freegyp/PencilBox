//
//  campusnewsCell.swift
//  PencilBox
//
//  Created by gyp on 4/16/16.
//  Copyright © 2016 gyp. All rights reserved.
//

import UIKit

class campusnewsCell: UITableViewCell {
    @IBOutlet var newsTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var imageUrlStr:String?
    var newsTextStr:String?{
        didSet{
            newsTextView.text = newsTextStr
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
