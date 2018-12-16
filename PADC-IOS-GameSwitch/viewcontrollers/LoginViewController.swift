//
//  LoginViewController.swift
//  PADC-IOS-GameSwitch
//
//  Created by AcePlus101 on 12/2/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn
import FBSDKLoginKit

class LoginViewController:BaseViewController,GIDSignInDelegate,GIDSignInUIDelegate{
    @IBOutlet weak var tvEmail: UITextField!
    @IBOutlet weak var tvPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    @IBAction func onClickLogin(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: tvEmail.text ?? "", password: tvPassword.text ?? "") { (authResult, error) in
            
            if let error = error {
                self.showAlertDialog(inputMessage: error.localizedDescription)
            }
            
            guard let user = authResult?.user else { return }
            
            if !user.isEmailVerified {
                
                self.showAlertDialog(inputMessage: "Please verify your email.")
                
            } else {
                let navigationVC = self.storyboard!.instantiateViewController(withIdentifier: "HomeViewController") as! UINavigationController
                let vc = navigationVC.viewControllers[0] as! HomeViewController
                self.present(navigationVC, animated: true, completion: nil)
            }
            
        }
        
    }
    
    @IBAction func onClickRegister(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Register",
                                      message: "",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default)
        { action in
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            
            Auth.auth().createUser(withEmail: emailField.text ?? "", password: passwordField.text ?? "", completion: { (authResult, error) in
                
                if let error = error {
                    self.showAlertDialog(inputMessage: error.localizedDescription)
                }
                
                guard let user = authResult?.user else { return }
                
                user.sendEmailVerification(completion: { (error) in
                    
                    if let error = error {
                        self.showAlertDialog(inputMessage: error.localizedDescription)
                    }
                })
            })
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default)
        
        alert.addTextField { textEmail in
            textEmail.placeholder = "Enter your email"
        }
        
        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "Enter your password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func onClickLoginWithGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func onClickFacebookLogin(_ sender: Any) {
        facebookLogin()
    }
    
    func facebookLogin() {
        let login = FBSDKLoginManager()
        login.logIn(withReadPermissions: ["email", "public_profile"], from: self, handler: { result, error in
            if error != nil {
                print("Process error")
            }
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
                if let error = error {
                    self.showAlertDialog(inputMessage: error.localizedDescription)
                    return
                }
                
                let navigationVC = self.storyboard!.instantiateViewController(withIdentifier: "HomeViewController") as! UINavigationController
                let vc = navigationVC.viewControllers[0] as! HomeViewController
                //        vc.data = beerItemList[indexPath.row]
                self.present(navigationVC, animated: true, completion: nil)
            }
            
        })
        
    }
    
    
    //like onActivityResult in android
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if (error) != nil {
            print("An error occured during Google Authentication")
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                self.showAlertDialog(inputMessage: error.localizedDescription)
                return
            }
            
            let navigationVC = self.storyboard!.instantiateViewController(withIdentifier: "HomeViewController") as! UINavigationController
            let vc = navigationVC.viewControllers[0] as! HomeViewController
            //        vc.data = beerItemList[indexPath.row]
            self.present(navigationVC, animated: true, completion: nil)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        if let aController = viewController {
            present(aController, animated: true) {() -> Void in }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        dismiss(animated: true) {() -> Void in }
    }

}
