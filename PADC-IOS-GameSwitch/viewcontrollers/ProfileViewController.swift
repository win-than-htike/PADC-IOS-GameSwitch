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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ivProfile.layer.masksToBounds = true
        ivProfile.layer.cornerRadius = 16
    }

    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
