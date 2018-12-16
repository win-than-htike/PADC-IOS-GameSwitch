//
//  GameResponse.swift
//  PADC-IOS-GameSwitch
//
//  Created by AcePlus101 on 12/13/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import Foundation

class GameVO{
    var developer = "", id: String = ""
    var images: [Image] = []
    var name: String = ""
    var price: Int = 0
    var rating: Double = 0.0
    var released_date = "",
    review: String = "",
    from_switch_posts:[PostVO] = [],
    to_switch_posts:[PostVO] = []
    
    public static func parseToDictionary(game : GameVO) -> [String : Any] {
        let value = [
                    "id" : game.id,
                    "name" : game.name,
                    "price" : game.price,
                    "rating" : game.rating,
                    "released_date" : game.released_date,
                    "review" : game.review,
                    "developer" : game.developer,
                    "images" : game.images,
                    "from_switch_posts" : game.from_switch_posts,
                    "to_switch_posts" : game.to_switch_posts
            ] as [String : Any]
        return value
    }
    
    public static func parseToGameVO(json : [String : Any]) -> GameVO {
        let game = GameVO()
        game.id = json["id"] as! String
        game.name = json["name"] as! String
        game.price = json["price"] as! Int
        game.rating = json["rating"] as! Double
        game.released_date = json["released_date"] as! String
        game.review = json["review"] as! String
        game.developer = json["developer"] as! String
        print(json["images"] ?? "no image")
//        game.images = json["images"] as! [Image]
        return game
    }

}

class Image {
    var image_url: String = ""
}
