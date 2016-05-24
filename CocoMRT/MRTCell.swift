//
//  MRTCell.swift
//  CocoMRT
//
//  Created by allen on 2016/5/19.
//  Copyright © 2016年 allen. All rights reserved.
//

import UIKit

class MRTCell: UITableViewCell {
    
    @IBOutlet weak var stationName: UILabel!
    
    @IBOutlet weak var line1: UILabel!

    @IBOutlet weak var line2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
   
    }
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

