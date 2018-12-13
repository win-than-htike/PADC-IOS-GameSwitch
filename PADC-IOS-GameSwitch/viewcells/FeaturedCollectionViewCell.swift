//
//  FeaturedCollectionViewCell.swift
//  PADC-IOS-GameSwitch
//
//  Created by DoeMyanmar on 12/12/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class FeaturedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivGame: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ivGame.layer.masksToBounds = true
        self.ivGame.layer.cornerRadius = 8
    }

}
