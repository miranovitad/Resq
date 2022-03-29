//
//  FormReqOpenViewController.swift
//  Resq UiKit
//
//  Created by Mira Novita Dewi Ni Putu on 28/07/21.
//

import UIKit

class FormReqOpenViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissSelf))

        //btn prev next
        btnNext.backgroundColor = UIColor.appColorBlue
        btnNext.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        
        labelTitle.font = UIFont.rounded(ofSize: 18, weight: .bold)
        
        labelDesc.textColor = UIColor.appColorDarkGrey
        labelDesc.font = UIFont.rounded(ofSize: 15, weight: .regular)
        labelDesc.setLineSpacing(lineSpacing: 1.5)
        labelDesc.textAlignment = .center
    }
}
