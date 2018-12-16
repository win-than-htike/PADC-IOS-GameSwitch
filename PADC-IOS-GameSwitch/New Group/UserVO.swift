//
//  UserVO.swift
//  PADC-IOS-GameSwitch
//
//  Created by AcePlus101 on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
class UserVO {
    var id = "",
    name: String = "",
    email: String = "",
    phone: String = "",
    gender = "",
    image: String = ""
    
    public static func parseToDictionary(user : UserVO) -> [String : Any] {
        let value = [
            "id" : user.id,
            "name" : user.name,
            "email" : user.email,
            "phone" : user.phone,
            "gender" : user.gender,
            "image" : user.image
            ] as [String : Any]
        return value
        
    }
    
    public static func parseToUserVO(json : [String : Any]) -> UserVO {
        
        let user = UserVO()
        user.id = json["id"] as! String
        user.name = json["name"] as! String
        user.email = json["email"] as! String
        user.phone = json["phone"] as! String
        user.gender = json["gender"] as! String
        user.image = json["image"] as! String
        return user
    }
}
