//
//  UserTableViewCell.swift
//  PADC-IOS-GameSwitch
//
//  Created by Crisis Core on 12/14/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var ivGame: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblUserName: UILabel!
    
    @IBOutlet weak var lblRemark: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        ivGame.layer.masksToBounds = true
        ivGame.layer.cornerRadius = 30
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
