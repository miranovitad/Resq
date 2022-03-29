//
//  FormAdditionalViewController.swift
//  Resq UiKit
//
//  Created by Mira Novita Dewi Ni Putu on 28/07/21.
//

import UIKit

class FormAdditionalViewController: UIViewController {
    
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
        labelDesc.font = UIFont.rounded(ofSize: 17, weight: .medium)
        
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
        
        btnYes.addTarget(self, action: #selector(btnClickedYes(sender:)),for: .touchUpInside)
        btnNo.addTarget(self, action: #selector(btnClickedNo(sender:)),for: .touchUpInside)
    }
    @objc func btnClickedYes(sender: UIButton!){
        btnActive(sender: sender)
        btnNotActive(sender: btnNo)
    }
    
    @objc func btnClickedNo(sender: UIButton!){
        btnActive(sender: sender)
        btnNotActive(sender: btnYes)
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
