//
//  GameDetailsViewController.swift
//  PADC-IOS-GameSwitch
//
//  Created by Crisis Core on 12/13/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class GameDetailsViewController: UIViewController {

    @IBOutlet weak var gameTableView: UITableView!
    
    var game : GameVO? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.gameTableView.delegate = self
        self.gameTableView.dataSource = self
        
        
        gameTableView.rowHeight = UITableView.automaticDimension
        gameTableView.estimatedRowHeight = 300

        Utils.cellRegister(nibName: "UserTableViewCell", tableView: gameTableView)
        Utils.cellRegister(nibName: "HeaderTableViewCell", tableView: gameTableView)
    
    }


    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension GameDetailsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
//        if indexPath.section == 0 {
//            let nav = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! UINavigationController
//            self.present( nav , animated: true , completion: nil)
//        }
        
    }
}

extension GameDetailsViewController : UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0  {
//            return 300
//        }else {
//          return 230
//        }
//
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return game?.from_switch_posts.count ?? 0
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as! HeaderTableViewCell
            
            cell.ivHeader.sd_setImage(with: URL(string: self.game!.images[0].image_url) , placeholderImage: UIImage(named: "game"))
            
            cell.lblGameName.text = self.game!.name
            cell.lblDeveloper.text  = self.game!.developer
            cell.lblPrice.text = "$" + String(self.game!.price)
            cell.lblDate.text = self.game!.released_date
            cell.cvRating.rating = self.game!.rating
            
            return cell
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
            
            let post = game?.from_switch_posts[indexPath.row]
            
            cell.ivGame.sd_setImage(with: URL(string: (post?.user.image)! ) , placeholderImage: UIImage(named: "profile"))
            cell.lblTitle.text = "I want to swith my " + (post?.fromGameName)! + " with " + (post?.toGameName)!
            cell.lblUserName.text = "Upload by " + (post?.user.name)!
            cell.lblRemark.text = post?.remark
            
            return cell
        }
      
    }
    
    
}
