//
//  BeforeSigninViewController.swift
//  Resq UiKit
//
//  Created by Mira Novita Dewi Ni Putu on 22/07/21.
//

import UIKit

class BeforeSigninViewController: UIViewController {

    @IBOutlet weak var labelGuest: UILabel!
    @IBOutlet weak var labelHi: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelTitleDesc: UILabel!
    @IBOutlet weak var buttonSignin: UIButton!
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissSelf))
        
        //label hi guest
        labelHi.font = UIFont.rounded(ofSize: 28, weight: .regular)
        labelGuest.font = UIFont.rounded(ofSize: 28, weight: .bold)
        
        //label title
        labelTitle.font = UIFont.rounded(ofSize: 24, weight: .bold)
        
        //label title desc
        labelTitleDesc.font = UIFont.rounded(ofSize: 15, weight: .regular)
        labelTitleDesc.textColor = UIColor.appColorDarkGrey
        labelTitleDesc.setLineSpacing(lineSpacing: 1.5)
        labelTitleDesc.textAlignment = .center
        
        //button
        buttonSignin.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        buttonSignin.backgroundColor = UIColor.appColorBlue
    }
}
