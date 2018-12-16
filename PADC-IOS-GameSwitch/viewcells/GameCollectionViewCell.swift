//
//  GameCollectionViewCell.swift
//  PADC-IOS-GameSwitch
//
//  Created by Crisis Core on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivGame: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ivGame.layer.masksToBounds = true
        ivGame.layer.cornerRadius = 8
    }

}
