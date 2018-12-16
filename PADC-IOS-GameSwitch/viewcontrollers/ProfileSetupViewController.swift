//
//  ProfileSetupViewController.swift
//  PADC-IOS-GameSwitch
//
//  Created by AcePlus101 on 12/15/18.
//  Copyright © 2018 padcmyanmar. All rights reserved.
//

import UIKit
import FirebaseAuth
import SDWebImage

class ProfileSetupViewController: BaseViewController {
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var sgcGender: UISegmentedControl!
    
    var profileImageUrl = ""
    
    let user = Auth.auth().currentUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageUrl = user.photoURL?.absoluteString ?? ""
        imgProfile.sd_setImage(with: URL(string: profileImageUrl), placeholderImage: UIImage(named: "user_add"))
        tfName.text = user.displayName
        tfEmail.text = user.email
        tfPhone.text = user.phoneNumber
        self.imgProfile.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClickProfileImage(_ :))))
    }

    @objc func onClickProfileImage(_ sender: UITapGestureRecognizer){
        print("click profile upload")
        self.chooseUpload(imagePickerControllerDelegate: self)
    }
    
    @IBAction func onClickNextButton(_ sender: UIButton) {
        guard let name = tfName.text else { return }
        guard let email = tfEmail.text else { return }
        guard let phone = tfPhone.text else { return }
        var gender = "Male"
        if sgcGender.selectedSegmentIndex == 1{
            gender = "Female"
        }
        let userVO = UserVO()
        userVO.id = user.uid
        userVO.name = name
        userVO.email = email
        userVO.phone = phone
        userVO.gender = gender
        DataModel.shared.addUser(user: userVO, success: {
            let navigationVC = self.storyboard!.instantiateViewController(withIdentifier: "HomeViewController") as! UINavigationController
//            let vc = navigationVC.viewControllers[0] as! HomeViewController
            self.present(navigationVC, animated: true, completion: nil)
            
            
        }) {
            
        }}
    
}
extension ProfileSetupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.dismiss(animated: true, completion: nil)
        
        if let pickedImage = info[.editedImage] as? UIImage {
            
            DataModel.shared.uploadImage(data: pickedImage.pngData(), success: { (url) in
                
                self.profileImageUrl = url
                
                self.imgProfile.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "user"))
                
            }) {
                self.showAlertDialog(inputMessage: "Error.")
            }
            
        }
        
    }
    
}


