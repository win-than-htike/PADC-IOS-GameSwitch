//
//  PopularCollectionViewCell.swift
//  PADC-IOS-GameSwitch
//
//  Created by Crisis Core on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    var popularGames : [GameVO] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.popularCollectionView.delegate = self
        self.popularCollectionView.dataSource  = self
        
        Utils.cellRegister(nibName: "FeaturedCollectionViewCell", collectionView: popularCollectionView)
        
    }

}

extension PopularCollectionViewCell : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let nav  = self.window?.rootViewController!.storyboard?.instantiateViewController(withIdentifier: "GameDetailsViewController") as! UINavigationController
        
        let vc  = nav.viewControllers[0] as! GameDetailsViewController
        
        vc.game = popularGames[indexPath.row]
        
        self.window?.rootViewController!.present( nav , animated: true , completion: nil )
        
    }
    
}

extension PopularCollectionViewCell : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularGames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCollectionViewCell", for: indexPath) as! FeaturedCollectionViewCell
        
        let game = popularGames[indexPath.row]
        
        cell.ivGame.sd_setImage(with: URL(string: game.images[0].image_url) , placeholderImage: UIImage(named: "game"))
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      //  let width = self.view.frame.width / 2 - 16
        let width = 200
        return CGSize(width: width, height: 270)
    }
    
}
