//
//  FormHousingPil1ViewController.swift
//  Resq UiKit
//
//  Created by Mira Novita Dewi Ni Putu on 28/07/21.
//

import UIKit

class FormHousingPil1ViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelQ1: UILabel!
    @IBOutlet weak var labelQ2: UILabel!
    @IBOutlet weak var labelQ3: UILabel!
    @IBOutlet weak var labelQ4: UILabel!
    @IBOutlet weak var labelQ5: UILabel!
    
    @IBOutlet weak var btnQ1Yes: UIButton!
    @IBOutlet weak var btnQ1No: UIButton!
    @IBOutlet weak var btnQ3Yes: UIButton!
    @IBOutlet weak var btnQ3No: UIButton!
    @IBOutlet weak var btnQ4Pil1: UIButton!
    @IBOutlet weak var btnQ4Pil2: UIButton!
    @IBOutlet weak var btnQ4Pil3: UIButton!
    @IBOutlet weak var btnQ4Pil4: UIButton!
    @IBOutlet weak var textQ2: UITextField!
    @IBOutlet weak var textQ5: UITextView!
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissSelf))
        
        //title label
        labelTitle.font = UIFont.rounded(ofSize: 34, weight: .bold)
        
        //label
        labelQ1.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelQ2.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelQ3.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelQ4.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelQ5.font = UIFont.rounded(ofSize: 16, weight: .medium)
        
        //btn pilihan yes
        btnQ1Yes.layer.borderWidth = 1
        btnQ1Yes.layer.borderColor = UIColor.appColorBlue.cgColor
        btnQ1Yes.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnQ1Yes.tintColor = UIColor.appColorBlue
        
        //btn pilihan no
        btnQ1No.layer.borderWidth = 1
        btnQ1No.layer.borderColor = UIColor.appColorBlue.cgColor
        btnQ1No.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnQ1No.tintColor = UIColor.appColorBlue
        
        //btn pilihan yes
        btnQ3Yes.layer.borderWidth = 1
        btnQ3Yes.layer.borderColor = UIColor.appColorBlue.cgColor
        btnQ3Yes.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnQ3Yes.tintColor = UIColor.appColorBlue
        
        //btn pilihan no
        btnQ3No.layer.borderWidth = 1
        btnQ3No.layer.borderColor = UIColor.appColorBlue.cgColor
        btnQ3No.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnQ3No.tintColor = UIColor.appColorBlue
        
        //btn pilihan
        //btn pilihan no 1
        btnQ4Pil1.layer.borderWidth = 1
        btnQ4Pil1.layer.borderColor = UIColor.appColorBlue.cgColor
        btnQ4Pil1.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnQ4Pil1.tintColor = UIColor.appColorBlue
        //btn pilihan no 2
        btnQ4Pil2.layer.borderWidth = 1
        btnQ4Pil2.layer.borderColor = UIColor.appColorBlue.cgColor
        btnQ4Pil2.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnQ4Pil2.tintColor = UIColor.appColorBlue
        //btn pilihan no 3
        btnQ4Pil3.layer.borderWidth = 1
        btnQ4Pil3.layer.borderColor = UIColor.appColorBlue.cgColor
        btnQ4Pil3.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnQ4Pil3.tintColor = UIColor.appColorBlue
        //btn pilihan no 4
        btnQ4Pil4.layer.borderWidth = 1
        btnQ4Pil4.layer.borderColor = UIColor.appColorBlue.cgColor
        btnQ4Pil4.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnQ4Pil4.tintColor = UIColor.appColorBlue
        
        //text field Q2
        textQ2.layer.borderColor = UIColor.appColorBlue.cgColor
        textQ2.layer.borderWidth = 1
        
        //texet Q5
        textQ5.layer.borderColor = UIColor.appColorBlue.cgColor
        textQ5.layer.borderWidth = 1
        
        //btn prev next
        btnNext.backgroundColor = UIColor.appColorBlue
        btnNext.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        btnPrev.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        
        //action button
        btnQ1Yes.addTarget(self, action: #selector(btnClickedQ1Yes(sender:)),for: .touchUpInside)
        btnQ1No.addTarget(self, action: #selector(btnClickedQ1No(sender:)),for: .touchUpInside)
        //Q3
        btnQ3Yes.addTarget(self, action: #selector(btnClickedQ3Yes(sender:)),for: .touchUpInside)
        btnQ3No.addTarget(self, action: #selector(btnClickedQ3No(sender:)),for: .touchUpInside)
        //Q4
        btnQ4Pil1.addTarget(self, action: #selector(btnClickedQ41(sender:)),for: .touchUpInside)
        btnQ4Pil2.addTarget(self, action: #selector(btnClickedQ42(sender:)),for: .touchUpInside)
        btnQ4Pil3.addTarget(self, action: #selector(btnClickedQ43(sender:)),for: .touchUpInside)
        btnQ4Pil4.addTarget(self, action: #selector(btnClickedQ44(sender:)),for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AboutYouFormViewController.viewTapped(gestureRecognizer:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func btnClickedQ1Yes(sender: UIButton!){
        btnActive(sender: sender)
        btnNotActive(sender: btnQ1No)
    }
    
    @objc func btnClickedQ1No(sender: UIButton!){
        btnActive(sender: sender)
        btnNotActive(sender: btnQ1Yes)
    }
    
    @objc func btnClickedQ3Yes(sender: UIButton!){
        btnActive(sender: sender)
        btnNotActive(sender: btnQ3No)
    }
    
    @objc func btnClickedQ3No(sender: UIButton!){
        btnActive(sender: sender)
        btnNotActive(sender: btnQ3Yes)
    }
    
    @objc func btnClickedQ41(sender: UIButton!){
        btnActive(sender: sender)
        btnNotActive(sender: btnQ4Pil2)
        btnNotActive(sender: btnQ4Pil3)
        btnNotActive(sender: btnQ4Pil4)
    }
    
    @objc func btnClickedQ42(sender: UIButton!){
        btnNotActive(sender: btnQ4Pil1)
        btnActive(sender: sender)
        btnNotActive(sender: btnQ4Pil3)
        btnNotActive(sender: btnQ4Pil4)
    }
    
    @objc func btnClickedQ43(sender: UIButton!){
        btnNotActive(sender: btnQ4Pil1)
        btnNotActive(sender: btnQ4Pil2)
        btnActive(sender: sender)
        btnNotActive(sender: btnQ4Pil4)
    }
    
    @objc func btnClickedQ44(sender: UIButton!){
        btnNotActive(sender: btnQ4Pil1)
        btnNotActive(sender: btnQ4Pil2)
        btnNotActive(sender: btnQ4Pil3)
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
