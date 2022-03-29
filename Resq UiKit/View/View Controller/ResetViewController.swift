//
//  ResetViewController.swift
//  Resq UiKit
//
//  Created by Mira Novita Dewi Ni Putu on 21/07/21.
//

import UIKit

class ResetViewController: UIViewController {
    
    @IBOutlet weak var labelReset: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var buttonSend: UIButton!
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissSelf))
        
        //reset password label
        labelReset.font = UIFont.rounded(ofSize: 36, weight: .bold)
        labelReset.textColor = UIColor.appColorBlue
        
        //label description
        labelDescription.font = UIFont.rounded(ofSize: 13, weight: .regular)
        labelDescription.textColor = UIColor.appColorDarkGrey
        labelDescription.setLineSpacing(lineSpacing: 1.5)
        
        //text field
        textEmail.layer.borderColor = UIColor.appColorBlue.cgColor
        textEmail.layer.borderWidth = 1
        
        //placeholder
        textEmail.setRightPaddingPoints(8)
        textEmail.setLeftPaddingPoints(8)
        
        //button
        buttonSend.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        buttonSend.backgroundColor = UIColor.appColorBlue
        
    }
}
