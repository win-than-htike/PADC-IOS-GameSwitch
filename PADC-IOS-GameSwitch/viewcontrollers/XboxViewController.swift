//
//  XboxViewController.swift
//  PADC-IOS-GameSwitch
//
//  Created by DoeMyanmar on 12/12/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class XboxViewController: BaseViewController {

    @IBOutlet weak var xboxCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.xboxCollectionView.delegate = self
        self.xboxCollectionView.dataSource = self
        
        Utils.cellRegister(nibName: "PopularCollectionViewCell", collectionView: xboxCollectionView)
        Utils.cellRegister(nibName: "LatestCollectionViewCell", collectionView: xboxCollectionView)
        Utils.cellRegister(nibName: "GameCollectionViewCell", collectionView: xboxCollectionView)

    }

}


extension XboxViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "GameDetailsViewController") as! UINavigationController
        
        
        self.present( nav , animated: true , completion: nil)
    }
}

extension XboxViewController : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else if section == 1 {
            return 1
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath)
            return cell
        }else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestCollectionViewCell", for: indexPath)
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath)
            return cell
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // let width = self.view.frame.width / 2 - 16
        if indexPath.section == 0 {
            return CGSize(width: self.view.frame.width , height: 350)
        }else if indexPath.section == 1 {
            return CGSize(width: self.view.frame.width , height: 350)
        }else {
            return CGSize(width: self.view.frame.width , height: 200)
        }
        
    }
    
}
