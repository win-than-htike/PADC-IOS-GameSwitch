//
//  HeaderTableViewCell.swift
//  PADC-IOS-GameSwitch
//
//  Created by DoeMyanmar on 12/13/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var viewForeground: UIView!
    
    @IBOutlet weak var ivHeader: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ivHeader.layer.masksToBounds = true
        ivHeader.layer.cornerRadius = 8
        
        viewForeground.layer.masksToBounds = true
        viewForeground.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
