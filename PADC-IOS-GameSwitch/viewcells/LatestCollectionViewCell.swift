//
//  LatestCollectionViewCell.swift
//  PADC-IOS-GameSwitch
//
//  Created by Crisis Core on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class LatestCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var latestCollectionView: UICollectionView!
    
    var latestGames : [GameVO] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.latestCollectionView.delegate = self
        self.latestCollectionView.dataSource = self
        
        Utils.cellRegister(nibName: "FeaturedCollectionViewCell", collectionView: latestCollectionView)
    }

}

extension LatestCollectionViewCell : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let nav  = self.window?.rootViewController!.storyboard?.instantiateViewController(withIdentifier: "GameDetailsViewController") as! UINavigationController
        
        let vc  = nav.viewControllers[0] as! GameDetailsViewController
        
        vc.game = latestGames[indexPath.row]
        
        self.window?.rootViewController!.present( nav , animated: true , completion: nil )
        
    }
}

extension LatestCollectionViewCell : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return latestGames.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCollectionViewCell", for: indexPath) as! FeaturedCollectionViewCell
        
        let game = latestGames[indexPath.row]
        
        cell.ivGame.sd_setImage(with: URL(string: game.images[0].image_url) , placeholderImage: UIImage(named: "game"))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize (width: 200 , height: 250)
        
    }
    
    
}
