//
//  File.swift
//  PADC-IOS-GameSwitch
//
//  Created by AcePlus101 on 12/2/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit

class Utils{
    
    static func cellRegister(nibName:String,collectionView:UICollectionView) {
        let nib = UINib(nibName: nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: nibName)
    }
    
    static func cellRegister(nibName:String,tableView:UITableView) {
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: nibName)
    }
    
}
