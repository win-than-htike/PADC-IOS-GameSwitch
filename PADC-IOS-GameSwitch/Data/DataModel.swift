//
//  DataManager.swift
//  PADC-IOS-GameSwitch
//
//  Created by AcePlus101 on 12/2/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataModel {
    
    private init() {}
    
    static var shared : DataModel =  {
        return sharedDataModel
    }()
    
    private static var sharedDataModel: DataModel = {
        let dataModel = DataModel()
        return dataModel
    }()
    
    func addUser(user:UserVO,success: @escaping () -> Void,failure: @escaping () -> Void){
        NetworkManager.shared.addUser(user: user, success: {
            success()
        }) {
            failure()
        }
    }
    
    func postGameSwitch(categoryName:String,trendName:String,fromGameId:String,toGameId:String,postVO:PostVO, success : @escaping () -> Void, failure : @escaping () -> Void){
        NetworkManager.shared.postGameSwitch(categoryName:categoryName,trendName:trendName,fromGameId: fromGameId, toGameId: toGameId, postVO: postVO, success: {
            success()
        }) {
            failure()
        }
    }
    func getGames(categoryName:String,nodeName:String,success : @escaping ([GameVO]) -> Void, failure : @escaping () -> Void) {
        NetworkManager.shared.loadGames(categoryName: categoryName,nodeName: nodeName,success: { (data) in
            success(data)
        }, failure: {
            failure()
        })
    }
    func uploadImage(data : Data?, success : @escaping (String) -> Void, failure : @escaping () -> Void) {
        NetworkManager.shared.imageUpload(data: data, success: { (url) in
            success(url)
        }) {
            failure()
        }
    }
    func getUser( userId : String , success : @escaping (UserVO) -> Void , failure : @escaping () -> Void)  {
        NetworkManager.shared.getUser(userId: userId, success: {(userVO) in
            success(userVO)
        }, failure: {
            
        })
    }
}
