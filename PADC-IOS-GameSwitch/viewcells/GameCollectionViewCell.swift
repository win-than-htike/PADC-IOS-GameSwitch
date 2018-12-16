//
//  GameCollectionViewCell.swift
//  PADC-IOS-GameSwitch
//
//  Created by Crisis Core on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import Cosmos

class GameCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivGame: UIImageView!
    
    @IBOutlet weak var tvGameName: UILabel!
    
    @IBOutlet weak var cvRating: CosmosView!
    
    @IBOutlet weak var tvDeveloper: UILabel!
    
    @IBOutlet weak var tvDate: UILabel!
    
    @IBOutlet weak var tvReview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ivGame.layer.masksToBounds = true
        ivGame.layer.cornerRadius = 8
    }

}
