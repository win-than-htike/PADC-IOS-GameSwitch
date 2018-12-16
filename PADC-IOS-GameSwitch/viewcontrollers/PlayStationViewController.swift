//
//  PlayStationViewController.swift
//  PADC-IOS-GameSwitch
//
//  Created by DoeMyanmar on 12/12/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import FirebaseAuth

class PlayStationViewController: BaseViewController {

    @IBOutlet weak var featuredCollectionView: UICollectionView!
    
    var popularGames  : [GameVO] = []
    var latestGames : [GameVO] = []
    var allGames : [GameVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.featuredCollectionView.delegate = self
        self.featuredCollectionView.dataSource = self
        
        Utils.cellRegister(nibName: "PopularCollectionViewCell", collectionView: featuredCollectionView)
        Utils.cellRegister(nibName: "LatestCollectionViewCell", collectionView: featuredCollectionView)
        Utils.cellRegister(nibName: "GameCollectionViewCell", collectionView: featuredCollectionView)
        
        DataModel.shared.getGames(categoryName: "psfour", nodeName: "popular_games", success: { (popularGames) in
            self.popularGames = popularGames
            self.featuredCollectionView.reloadData()
        }) {
            
        }
        
        DataModel.shared.getGames(categoryName: "psfour", nodeName: "latest_games", success: { (latestGames) in
            self.latestGames = latestGames
            self.featuredCollectionView.reloadData()
        }) {
            
        }
        
        DataModel.shared.getGames(categoryName: "psfour", nodeName: "normal_games", success: { (allGames) in
            self.allGames = allGames
           self.featuredCollectionView.reloadData()
        }) {
            
        }
        

    }
    
    @IBAction func onClickProfile(_ sender: UIBarButtonItem) {
        let nav  = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! UINavigationController
       
        let vc  = nav.viewControllers[0] as! ProfileViewController
        
        vc.userId =  Auth.auth().currentUser!.uid
        
        self.present(nav , animated: true , completion:  nil)
    }
    
}

extension PlayStationViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section != 0 && indexPath.section != 1{
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "GameDetailsViewController") as! UINavigationController
            
            let vc = nav.viewControllers[0] as! GameDetailsViewController
            
            vc.game = allGames[indexPath.row]
            
            self.present( nav , animated: true , completion: nil)
        }
      
    }
}

extension PlayStationViewController : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else if section == 1 {
            return 1
        } else {
            return allGames.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as! PopularCollectionViewCell
            
            cell.popularGames = self.popularGames
            cell.popularCollectionView.reloadData()
            
            return cell
        }else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LatestCollectionViewCell", for: indexPath) as! LatestCollectionViewCell
            
            cell.latestGames = self.latestGames
            cell.latestCollectionView.reloadData()
            
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath) as! GameCollectionViewCell
            
            let game = allGames[indexPath.row]
            cell.ivGame.sd_setImage(with: URL(string: game.images[0].image_url), placeholderImage: UIImage(named: "game"))
            
            cell.tvGameName.text = game.name
            cell.cvRating.rating = game.rating
            cell.tvDate.text = game.released_date
            cell.tvReview.text = game.review
            
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
