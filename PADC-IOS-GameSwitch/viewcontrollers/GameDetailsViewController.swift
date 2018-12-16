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
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            let nav = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! UINavigationController
            self.present( nav , animated: true , completion: nil)
        }
        
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
             return 10
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath)
            
            return cell
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath)
            
            return cell
        }
      
    }
    
    
}
