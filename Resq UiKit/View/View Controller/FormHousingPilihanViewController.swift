//
//  FormHousingViewController.swift
//  Resq UiKit
//
//  Created by Mira Novita Dewi Ni Putu on 27/07/21.
//

import UIKit

class FormHousingPilihanViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPil1: UIButton!
    @IBOutlet weak var btnPil2: UIButton!
    @IBOutlet weak var btnPil3: UIButton!
    @IBOutlet weak var btnPil4: UIButton!
    
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
        
        //btn pilihan 1
        btnPil1.layer.borderWidth = 1
        btnPil1.layer.borderColor = UIColor.appColorBlue.cgColor
        btnPil1.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnPil1.tintColor = UIColor.appColorBlue
        
        //btn pilihan 2
        btnPil2.layer.borderWidth = 1
        btnPil2.layer.borderColor = UIColor.appColorBlue.cgColor
        btnPil2.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnPil2.tintColor = UIColor.appColorBlue
        
        //btn pilihan 3
        btnPil3.layer.borderWidth = 1
        btnPil3.layer.borderColor = UIColor.appColorBlue.cgColor
        btnPil3.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnPil3.tintColor = UIColor.appColorBlue
        
        //btn pilihan 4
        btnPil4.layer.borderWidth = 1
        btnPil4.layer.borderColor = UIColor.appColorBlue.cgColor
        btnPil4.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnPil4.tintColor = UIColor.appColorBlue
        
        //btn prev next
        btnNext.backgroundColor = UIColor.appColorBlue
        btnNext.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        btnPrev.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        
        //action button
        btnPil1.addTarget(self, action: #selector(btnClicked1(sender:)),for: .touchUpInside)
        btnPil2.addTarget(self, action: #selector(btnClicked2(sender:)),for: .touchUpInside)
        btnPil3.addTarget(self, action: #selector(btnClicked3(sender:)),for: .touchUpInside)
        btnPil4.addTarget(self, action: #selector(btnClicked4(sender:)),for: .touchUpInside)
    }
    
    @objc func btnClicked1(sender: UIButton!){
        btnActive(sender: sender)
        btnNotActive(sender: btnPil2)
        btnNotActive(sender: btnPil3)
        btnNotActive(sender: btnPil4)
    }
    
    @objc func btnClicked2(sender: UIButton!){
        btnNotActive(sender: btnPil1)
        btnActive(sender: sender)
        btnNotActive(sender: btnPil3)
        btnNotActive(sender: btnPil4)
    }
    
    @objc func btnClicked3(sender: UIButton!){
        btnNotActive(sender: btnPil1)
        btnNotActive(sender: btnPil2)
        btnActive(sender: sender)
        btnNotActive(sender: btnPil4)
    }
    
    @objc func btnClicked4(sender: UIButton!){
        btnNotActive(sender: btnPil1)
        btnNotActive(sender: btnPil2)
        btnNotActive(sender: btnPil3)
        btnActive(sender: sender)
    }
    
    @objc func btnActive(sender: UIButton!) {
        sender.backgroundColor = UIColor.appColorBlue
        sender.setTitleColor(UIColor.white, for: .normal)
    }
    @objc func btnNotActive(sender: UIButton!) {
        sender.backgroundColor = UIColor.white
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.appColorBlue.cgColor
        sender.setTitleColor(UIColor.appColorBlue, for: .normal)
    }
}
