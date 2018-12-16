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
    let storageRef = Storage.storage().reference().child("images")
    
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
    
    func addUser(user : UserVO, success : @escaping () -> Void, failure : @escaping () -> Void) {
        rootRef.child("users").child(user.id).setValue(UserVO.parseToDictionary(user: user))
        success()
    }
    
    func getUser(userId : String , success : @escaping (UserVO) -> Void , failure : @escaping () -> Void) {
        rootRef.child("users").child(userId).observeSingleEvent(of: .value) { (dataSnapshot) in
            if  let value = dataSnapshot.value as? [String : AnyObject]{
                let user = UserVO.parseToUserVO(json: value)
                success(user)
            }
            
            
        }
    }
    
    func loadGames(categoryName:String,nodeName:String,success : @escaping ([GameVO]) -> Void, failure : @escaping () -> Void) {
            rootRef.child(categoryName).child(nodeName).observe(.value) { (dataSnapshot) in
            if let games = dataSnapshot.children.allObjects as? [DataSnapshot] {
                var gameList : [GameVO] = []
                for game in games {
                    if let value = game.value as? [String : AnyObject] {
                        let gameVo = GameVO.parseToGameVO(json: value)
                        if let gameImages = game.childSnapshot(forPath: "images").children.allObjects as? [DataSnapshot] {
                            for gameImage in gameImages{
                                if let s = gameImage.value as? [String : AnyObject] {
                                    let image = Image()
                                    image.image_url = s["image_url"] as! String
                                    gameVo.images.append(image)
                                }
                            }
                        } else {
                            print("haha")
                        }
                        if let gameSwitchPosts = game.childSnapshot(forPath: "from_switch_posts").children.allObjects as? [DataSnapshot] {
                            for gameSwitchPost in gameSwitchPosts{
                                if let switchPost = gameSwitchPost.value as? [String : AnyObject] {
                                    let post = PostVO()
                                    post.id = switchPost["id"] as! String
                                    post.fromGameName = switchPost["fromGameName"] as! String
                                    post.toGameName = switchPost["toGameName"] as! String
                                    post.remark = switchPost["remark"] as! String
                                    
                                    if let gameSwitchUsers = gameSwitchPost.childSnapshot(forPath: post.id).children.allObjects as? [DataSnapshot] {
                                        for gameSwitchUser in gameSwitchUsers{
                                            if let switchUser = gameSwitchUser.value as? [String : AnyObject] {
                                                let user = UserVO()
                                                user.id = switchUser["id"] as! String
                                                user.name = switchUser["name"] as! String
                                                user.email = switchUser["email"] as! String
                                                user.phone = switchUser["phone"] as! String
                                                user.gender = switchUser["gender"] as! String
                                                user.image = switchUser["image"] as! String
                                                
                                                post.user = user
                                            }
                                        }
                                    } else {
                                        print("haha")
                                    }
                                    
                                    gameVo.from_switch_posts.append(post)
                                }
                            }
                        } else {
                            print("haha")
                        }
                        
                        if let gameSwitchPosts = game.childSnapshot(forPath: "to_switch_posts").children.allObjects as? [DataSnapshot] {
                            for gameSwitchPost in gameSwitchPosts{
                                if let switchPost = gameSwitchPost.value as? [String : AnyObject] {
                                    let post = PostVO()
                                    post.id = switchPost["id"] as! String
                                    post.fromGameName = switchPost["fromGameName"] as! String
                                    post.toGameName = switchPost["toGameName"] as! String
                                    post.remark = switchPost["remark"] as! String
                                    
                                    if let gameSwitchUsers = gameSwitchPost.childSnapshot(forPath: post.id).children.allObjects as? [DataSnapshot] {
                                        for gameSwitchUser in gameSwitchUsers{
                                            if let switchUser = gameSwitchUser.value as? [String : AnyObject] {
                                                let user = UserVO()
                                                user.id = switchUser["id"] as! String
                                                user.name = switchUser["name"] as! String
                                                user.email = switchUser["email"] as! String
                                                user.phone = switchUser["phone"] as! String
                                                user.gender = switchUser["gender"] as! String
                                                user.image = switchUser["image"] as! String
                                                
                                                post.user = user
                                            }
                                        }
                                    } else {
                                        print("haha")
                                    }
                                    
                                    gameVo.from_switch_posts.append(post)
                                }
                            }
                        } else {
                            print("haha")
                        }
                        
                        gameList.append(gameVo)
                    }
                }
                success(gameList)
            }
        }
        
    }
    
    func postGameSwitch(fromGameId:String,toGameId:String,postVO:PostVO, success : @escaping () -> Void, failure : @escaping () -> Void) {
        rootRef.child(fromGameId).child("from_switch_posts").child(postVO.user.id).setValue(PostVO.parseToDictionary(post: postVO))
        rootRef.child(toGameId).child("to_switch_posts").child(postVO.user.id).setValue(PostVO.parseToDictionary(post: postVO))
        success()
    }
    
    
    func imageUpload(data : Data?, success : @escaping (String) -> Void, failure : @escaping () -> Void) {
        
        if let imageData = data {
            let uploadImageRef = storageRef.child("\(Date().millisecondsSince1970).png")
            
            let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in
                
                print(metadata ?? "NO METADATA")
                print(error ?? "NO ERROR")
                
                uploadImageRef.downloadURL(completion: { (url, error) in
                    if let error = error {
                        print(error)
                    }
                    if let url = url {
                        print(url.absoluteString)
                        success(url.absoluteString)
                    } else {
                        failure()
                    }
                })
            }
            uploadTask.observe(.progress) { (snapshot) in
                print("progress \(String(describing: snapshot.progress))")
            }
            uploadTask.resume()
        }
    }
}
