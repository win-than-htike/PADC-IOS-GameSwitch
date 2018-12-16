//
//  ProfileViewController.swift
//  PADC-IOS-GameSwitch
//
//  Created by Crisis Core on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var ivProfile: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblPhone: UILabel!
    
    @IBOutlet weak var lblGender: UILabel!
    
    var userId : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ivProfile.layer.masksToBounds = true
        ivProfile.layer.cornerRadius = 16
        
        NetworkManager.shared.getUser(userId: userId, success: { (user) in
             self.ivProfile.sd_setImage(with: URL(string: user.image) , placeholderImage: UIImage(named: "profile"))
            self.lblName.text = user.name
            self.lblEmail.text = user.email
            self.lblPhone.text = user.phone
            self.lblGender.text = user.gender
            
        }) {
            
        }
        
    }

    @IBAction func onClickUploadPost(_ sender: Any) {
                    let navigationVC = self.storyboard!.instantiateViewController(withIdentifier: "PostUploadViewController") as! UINavigationController
                    //            let vc = navigationVC.viewControllers[0] as! HomeViewController
                    self.present(navigationVC, animated: true, completion: nil)
    }
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
