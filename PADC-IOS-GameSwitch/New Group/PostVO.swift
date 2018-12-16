//
//  PostVO.swift
//  PADC-IOS-GameSwitch
//
//  Created by AcePlus101 on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation
class PostVO{
    var id:String = ""
    var fromGameName:String = ""
    var toGameName:String = ""
    var remark:String = ""
    var user:UserVO = UserVO()
    
    public static func parseToDictionary(post : PostVO) -> [String : Any] {
        let value = [
            "id" : post.id,
            "fromGameName" : post.fromGameName,
            "toGameName" : post.toGameName,
            "remark" : post.remark,
            "user": UserVO.parseToDictionary(user: post.user)
            ] as [String : Any]
        return value
    }
    
    public static func parseToPostVO(json : [String : Any]) -> PostVO {
        let post = PostVO()
        post.id = json["id"] as! String
        post.fromGameName = json["fromGameName"] as! String
        post.toGameName = json["toGameName"] as! String
        post.remark = json["remark"] as! String
        
        return post
    }
}
