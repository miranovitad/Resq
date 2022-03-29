//
//  FormHousingViewController.swift
//  Resq UiKit
//
//  Created by Mira Novita Dewi Ni Putu on 27/07/21.
//

import UIKit

class FormHousingViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissSelf))
        
        //label title
        labelTitle.font = UIFont.rounded(ofSize: 34, weight: .bold)
        
        //label desc
        labelDesc.font = UIFont.rounded(ofSize: 16, weight: .medium)
        
        //btn pilihan yes
        btnYes.layer.borderWidth = 1
        btnYes.layer.borderColor = UIColor.appColorBlue.cgColor
        btnYes.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnYes.tintColor = UIColor.appColorBlue
        
        //btn pilihan no
        btnNo.layer.borderWidth = 1
        btnNo.layer.borderColor = UIColor.appColorBlue.cgColor
        btnNo.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnNo.tintColor = UIColor.appColorBlue
        
        //btn prev next
        btnNext.backgroundColor = UIColor.appColorBlue
        btnNext.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        btnPrev.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        
        btnYes.addTarget(self, action: #selector(chooseYes(sender:)),for: .touchUpInside)
        
        btnNo.addTarget(self, action: #selector(chooseNo(sender:)),for: .touchUpInside)
    }
    
    @objc func chooseYes(sender: UIButton!) {
        btnYes.backgroundColor = UIColor.appColorBlue
        btnYes.setTitleColor(UIColor.white, for: .normal)
        btnNo.backgroundColor = UIColor.white
        btnNo.layer.borderWidth = 1
        btnNo.layer.borderColor = UIColor.appColorBlue.cgColor
        btnNo.setTitleColor(UIColor.appColorBlue, for: .normal)
    }
    
    @objc func chooseNo(sender: UIButton!) {
        btnNo.backgroundColor = UIColor.appColorBlue
        btnNo.setTitleColor(UIColor.white, for: .normal)
        btnYes.backgroundColor = UIColor.white
        btnYes.layer.borderWidth = 1
        btnYes.layer.borderColor = UIColor.appColorBlue.cgColor
        btnYes.setTitleColor(UIColor.appColorBlue, for: .normal)
    }
    
}
