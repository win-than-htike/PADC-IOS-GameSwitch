//
//  HeaderTableViewCell.swift
//  PADC-IOS-GameSwitch
//
//  Created by DoeMyanmar on 12/13/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import Cosmos

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var viewForeground: UIView!
    
    @IBOutlet weak var ivHeader: UIImageView!
    
    @IBOutlet weak var viewDev: UIView!
    
    @IBOutlet weak var lblGameName: UILabel!
    
    @IBOutlet weak var cvRating: CosmosView!
    
    @IBOutlet weak var lblDeveloper: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ivHeader.layer.masksToBounds = true
        ivHeader.layer.cornerRadius = 8
        
        viewForeground.layer.masksToBounds = true
        viewForeground.layer.cornerRadius = 8
        
        viewDev.layer.masksToBounds = true
        viewDev.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
