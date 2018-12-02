//
//  File.swift
//  PADC-IOS-GameSwitch
//
//  Created by AcePlus101 on 12/2/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//


import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage

class NetworkManager {
    
    let rootRef : DatabaseReference!
    
    private init() {
        rootRef = Database.database().reference()
    }
    
    static var shared : NetworkManager =  {
        return sharedNetworkManager
    }()
    
    private static var sharedNetworkManager: NetworkManager = {
        let networkManager = NetworkManager()
        return networkManager
    }()
   
}
