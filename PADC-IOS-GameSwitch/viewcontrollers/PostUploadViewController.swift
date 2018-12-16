//
//  PostUploadViewController.swift
//  PADC-IOS-GameSwitch
//
//  Created by AcePlus101 on 12/16/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import FirebaseAuth

class PostUploadViewController: UIViewController {
    
    @IBOutlet weak var vCategory: UIView!
    @IBOutlet weak var vTrend: UIView!
    @IBOutlet weak var vFromGame: UIView!
    @IBOutlet weak var vToGame: UIView!
    
    @IBOutlet weak var tvRemark: UITextView!
    
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblTrend: UILabel!
    @IBOutlet weak var lblFromGame: UILabel!
    @IBOutlet weak var lblToGame: UILabel!
    
    var fromGames:[GameVO] = []
    var toGames:[GameVO] = []
    
    var fromGameList = [("Simple","Simple")]
    var toGameList = [("Simple","Simple")]

    var selectedCategory = "psfour"
    var selectedTrend = "latest_games"
    var selectedFromGame = "Women"
    var selectedToGame = "Both"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblCategory.text = "PS4"
        self.lblTrend.text = "Latest"
        self.lblFromGame.text = ""
        self.lblToGame.text = ""
        self.vFromGame.isUserInteractionEnabled = false
        self.vToGame.isUserInteractionEnabled = false
        
        self.vCategory.layer.borderWidth = 1
        self.vCategory.layer.cornerRadius = 4 as CGFloat
        self.vCategory.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
        
        self.vTrend.layer.borderWidth = 1
        self.vTrend.layer.cornerRadius = 4 as CGFloat
        self.vTrend.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
        
        self.vFromGame.layer.borderWidth = 1
        self.vFromGame.layer.cornerRadius = 4 as CGFloat
        self.vFromGame.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
        
        self.vToGame.layer.borderWidth = 1
        self.vToGame.layer.cornerRadius = 4 as CGFloat
        self.vToGame.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
        
        self.tvRemark.layer.borderWidth = 1
        self.tvRemark.layer.cornerRadius = 4 as CGFloat
        self.tvRemark.layer.borderColor = UIColor(red:205.0/255.0, green:205.0/255.0, blue:205.0/255.0, alpha: 1.0).cgColor
        
    self.vCategory.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClickCategory(_:))))
        
    self.vTrend.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClickTrend(_:))))
        
    self.vFromGame.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClickFromGameList(_ :))))
    self.vToGame.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClickToGameList(_ :))))
    }
    
    
    @objc func onClickCategory(_ sender: UITapGestureRecognizer){
        openCategorySelectionPopUp()
    }
    
    @objc func onClickTrend(_ sender: UITapGestureRecognizer){
        openTrendSelectionPopUp()
    }
    
    @objc func onClickFromGameList(_ sender: UITapGestureRecognizer){
        openFromGameSelectionPopUp()
    }
    
    @objc func onClickToGameList(_ sender: UITapGestureRecognizer){
        openToGameSelectionPopUp()
    }
    
    
    func openCategorySelectionPopUp() {
        let selectedValue = selectedCategory //update this for selected value
        let action = UIAlertController.actionSheetWithItems(items: [("PS4","psfour"),("Xbox","xbox"),("Nitendo","nitendo")], currentSelection: selectedValue, action: { (value)  in
            if value == "psfour"{
                self.lblCategory.text = "PS4"
            }else if value == "xbox"{
                self.lblCategory.text = "Xbox"
            }else{
                self.lblCategory.text = "Nitendo"
            }
            self.selectedCategory = value
            DataModel.shared.getGames(categoryName: self.selectedCategory, nodeName: self.selectedTrend, success: { (games) in
                var myDictionary = [(String(),String())]
                for game in games {
                    myDictionary.append((game.name,game.name))
                }
                self.fromGames = games
                self.toGames = games
                self.fromGameList = myDictionary
                self.toGameList = myDictionary
                self.lblFromGame.text = games[0].name
                self.lblToGame.text = games[0].name
                self.vFromGame.isUserInteractionEnabled = true
                self.vToGame.isUserInteractionEnabled = true
            }, failure: {
                
            })
            print(value)
        })
        action.addAction(UIAlertAction.init(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        //Present the controller
        self.present(action, animated: true, completion: nil)
    }
    
    
    func openTrendSelectionPopUp() {
        let selectedValue = selectedTrend //update this for selected value
        let action = UIAlertController.actionSheetWithItems(items: [("Latest","latest_games"),("Popular","popular_games"),("Normal","normal_games")], currentSelection: selectedValue, action: { (value)  in
            if value == "latest_games"{
                self.lblTrend.text = "Latest"
            }else if value == "popular_games"{
                self.lblTrend.text = "Popular"
            }else{
                self.lblTrend.text = "Normal"
            }
            self.selectedTrend = value
            DataModel.shared.getGames(categoryName: self.selectedCategory, nodeName: self.selectedTrend, success: { (games) in
                var myDictionary = [(String(),String())]
                for game in games {
                    myDictionary.append((game.name,game.name))
                }
                self.fromGames = games
                self.toGames = games
                self.fromGameList = myDictionary
                self.toGameList = myDictionary
                self.lblFromGame.text = games[0].name
                self.lblToGame.text = games[0].name
                self.vFromGame.isUserInteractionEnabled = true
                self.vToGame.isUserInteractionEnabled = true
            }, failure: {
                
            })
            print(value)
        })
        action.addAction(UIAlertAction.init(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        //Present the controller
        self.present(action, animated: true, completion: nil)
    }
    
    func openFromGameSelectionPopUp() {
        let selectedValue = selectedFromGame //update this for selected value
        let action = UIAlertController.actionSheetWithItems(items: fromGameList, currentSelection: selectedValue, action: { (value)  in
            self.lblFromGame.text = value
            self.selectedFromGame = value
            print(value)
        })
        action.addAction(UIAlertAction.init(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        //Present the controller
        self.present(action, animated: true, completion: nil)
    }

    
    func openToGameSelectionPopUp() {
        let selectedValue = selectedToGame //update this for selected value
        let action = UIAlertController.actionSheetWithItems(items: toGameList, currentSelection: selectedValue, action: { (value)  in
            self.lblToGame.text = value
            self.selectedToGame = value
            print(value)
        })
        action.addAction(UIAlertAction.init(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        //Present the controller
        self.present(action, animated: true, completion: nil)
    }
    
    @IBAction func btnSwitchGame(_ sender: UIButton) {
        print("Switch Game")
        let post = PostVO()
        post.id = String(Date().millisecondsSince1970)
        post.fromGameName = lblFromGame.text ?? ""
        post.toGameName = lblToGame.text ?? ""
        post.remark = tvRemark.text ?? ""
        
        let authUser = Auth.auth().currentUser
        let user = UserVO()
        user.id = authUser?.uid ?? ""
        user.name = authUser?.displayName ?? "Kyaw Kyaw"
        user.email = authUser?.email ?? ""
        user.phone = authUser?.phoneNumber ?? ""
        post.user = user
        
        var categoryName = ""
        if selectedCategory == "psfour"{
            categoryName = "psfour"
        }else if selectedCategory == "xbox"{
            categoryName = "xbox"
        }else{
            categoryName = "nitendo"
        }
        var trendName = ""
        if selectedTrend == "popular_games"{
            trendName = "popular_games"
        }else if selectedTrend == "latest_games"{
            trendName = "latest_games"
        }else{
            trendName = "normal_games"
        }
        
        var fromGameId = ""
        var toGameId = ""
        
        for game in fromGames{
            if game.name == selectedFromGame{
                fromGameId = game.id
            }
            if game.name == selectedToGame{
                toGameId = game.id
            }
        }
            DataModel.shared.postGameSwitch(categoryName:categoryName,trendName:trendName,fromGameId:fromGameId,toGameId:toGameId,postVO:post, success : {
//            let navigationVC = self.storyboard!.instantiateViewController(withIdentifier: "HomeViewController") as! UINavigationController
//            //            let vc = navigationVC.viewControllers[0] as! HomeViewController
//            self.present(navigationVC, animated: true, completion: nil)
            
                print("Success uploaded")
        }, failure :{
            
        })
        
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

}
