//
//  RegisterViewController.swift
//  Resq UiKit
//
//  Created by Mira Novita Dewi Ni Putu on 16/07/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var labelSignup: UILabel!
    @IBOutlet weak var textFirstName: UITextField!
    @IBOutlet weak var textLastName: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textConfirmPass: UITextField!
    @IBOutlet weak var buttonSignup: UIButton!
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissSelf))
        
        //sign in label
        labelSignup.font = UIFont.rounded(ofSize: 36, weight: .bold)
        labelSignup.textColor = UIColor.appColorBlue
            
        //text field
        textFirstName.layer.borderColor = UIColor.appColorBlue.cgColor
        textLastName.layer.borderColor = UIColor.appColorBlue.cgColor
        textEmail.layer.borderColor = UIColor.appColorBlue.cgColor
        textPassword.layer.borderColor = UIColor.appColorBlue.cgColor
        textConfirmPass.layer.borderColor = UIColor.appColorBlue.cgColor
                    
        textFirstName.layer.borderWidth = 1
        textLastName.layer.borderWidth = 1
        textEmail.layer.borderWidth = 1
        textPassword.layer.borderWidth = 1
        textConfirmPass.layer.borderWidth = 1
                    
        //placeholder
        textFirstName.setRightPaddingPoints(8)
        textFirstName.setLeftPaddingPoints(8)
        textLastName.setRightPaddingPoints(8)
        textLastName.setLeftPaddingPoints(8)
        textEmail.setRightPaddingPoints(8)
        textEmail.setLeftPaddingPoints(8)
        textPassword.setRightPaddingPoints(8)
        textPassword.setLeftPaddingPoints(8)
        textConfirmPass.setRightPaddingPoints(8)
        textConfirmPass.setLeftPaddingPoints(8)
                    
        //button
        buttonSignup.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        buttonSignup.backgroundColor = UIColor.appColorBlue
    }
}

