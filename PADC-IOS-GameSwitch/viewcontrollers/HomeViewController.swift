//
//  HomeViewController.swift
//  PADC-IOS-GameSwitch
//
//  Created by AcePlus101 on 12/2/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DataModel.shared.getGames(categoryName: "ps4", nodeName: "popular_games",success: { (games) in
            print(games)
        }) {
            print("loading failed")
        }
        DataModel.shared.getGames(categoryName: "xbox", nodeName: "popular_games",success: { (games) in
            print(games)
        }) {
            print("loading failed")
        }
        DataModel.shared.getGames(categoryName: "nitendo", nodeName: "normal_games",success: { (games) in
            print(games)
        }) {
            print("loading failed")
        }
    }

}
