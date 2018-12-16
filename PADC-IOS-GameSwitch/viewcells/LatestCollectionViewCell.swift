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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.latestCollectionView.delegate = self
        self.latestCollectionView.dataSource = self
        
        Utils.cellRegister(nibName: "FeaturedCollectionViewCell", collectionView: latestCollectionView)
    }

}

extension LatestCollectionViewCell : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let nav  = self.window?.rootViewController!.storyboard?.instantiateViewController(withIdentifier: "GameDetailsViewController")
        
        self.window?.rootViewController!.present( nav! , animated: true , completion: nil )
        
    }
}

extension LatestCollectionViewCell : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCollectionViewCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize (width: 200 , height: 250)
        
    }
    
    
}
