//
//  PlayStationViewController.swift
//  PADC-IOS-GameSwitch
//
//  Created by DoeMyanmar on 12/12/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class PlayStationViewController: BaseViewController {

    @IBOutlet weak var featuredCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.featuredCollectionView.delegate = self
        self.featuredCollectionView.dataSource = self
        
        Utils.cellRegister(nibName: "FeaturedCollectionViewCell", collectionView: featuredCollectionView)

    }
    
    

}

extension PlayStationViewController : UICollectionViewDelegate {
    
}

extension PlayStationViewController : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedCollectionViewCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width , height: 200)
    }
    
}
