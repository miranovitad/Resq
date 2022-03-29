//
//  LoginViewController.swift
//  Resq UiKit
//
//  Created by Mira Novita Dewi Ni Putu on 15/07/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var labelSignup: UILabel!
    @IBOutlet weak var btnForgotPass: UIButton!
    @IBOutlet weak var btnSignup: UIButton!
    @IBOutlet weak var buttonSignin: UIButton!
    @IBOutlet weak var labelSignin: UILabel!
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissSelf))
        
        //sign in label
        labelSignin.font = UIFont.rounded(ofSize: 34, weight: .bold)
        labelSignin.textColor = UIColor.appColorBlue
        
        //text field
        textEmail.layer.borderColor = UIColor.appColorBlue.cgColor
        textPassword.layer.borderColor = UIColor.appColorBlue.cgColor
        textEmail.layer.borderWidth = 1
        textPassword.layer.borderWidth = 1
        
        //placeholder
        textEmail.setRightPaddingPoints(8)
        textEmail.setLeftPaddingPoints(8)
        textPassword.setRightPaddingPoints(8)
        textPassword.setLeftPaddingPoints(8)
        
        //forgot password
        btnForgotPass.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnForgotPass.setTitleColor(UIColor.appColorBlue, for: .normal)
        
        //button
        buttonSignin.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        buttonSignin.backgroundColor = UIColor.appColorBlue
        
        //sign up
        labelSignup.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        labelSignup.textColor = UIColor.appColorBlue
        btnSignup.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnSignup.setTitleColor(UIColor.appColorBlue, for: .normal)
    }
}

