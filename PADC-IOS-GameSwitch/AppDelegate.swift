//
//  AppDelegate.swift
//  PADC-IOS-GameSwitch
//
//  Created by Win Than Htike on 12/2/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        validateLoginUser(success: { (vc) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            print(vc)
            let initialViewController = storyboard.instantiateViewController(withIdentifier: vc)
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
        })
        
        return true
    }
    
    func validateLoginUser(success: @escaping (String) -> Void){
        let rootRef = Database.database().reference()
        var vc = "LoginViewController"
        
        if let user = Auth.auth().currentUser{
            if user.isEmailVerified{
                vc = "ProfileSetupViewController"
            }//need to add logic ?
            
            rootRef.child("users").observe(.value) { (dataSnapshot) in
                if dataSnapshot.hasChild(user.uid){
                    vc = "HomeViewController"
                    success(vc)
                }else{
                    vc = "ProfileSetupViewController"
                    success(vc)
                }
            }
        }else{
            success(vc)
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

