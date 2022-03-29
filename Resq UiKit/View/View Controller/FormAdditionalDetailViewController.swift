//
//  FormAdditionalDetailViewController.swift
//  Resq UiKit
//
//  Created by Mira Novita Dewi Ni Putu on 28/07/21.
//

import UIKit

class FormAdditionalDetailViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnNext: UIButton!

    @IBOutlet weak var labelQ1: UILabel!
    @IBOutlet weak var labelQ2: UILabel!
    @IBOutlet weak var labelQ3: UILabel!
    @IBOutlet weak var labelQ4: UILabel!
    @IBOutlet weak var labelQ5: UILabel!
    @IBOutlet weak var labelQ6: UILabel!
    
    @IBOutlet weak var textQ2: UITextView!
    @IBOutlet weak var textQ1: UITextView!
    @IBOutlet weak var textQ5: UITextField!
    @IBOutlet weak var textQ6: UITextView!
    
    @IBOutlet weak var btnQ3Yes: UIButton!
    @IBOutlet weak var btnQ3No: UIButton!
    @IBOutlet weak var btnQ3Dont: UIButton!
    
    @IBOutlet weak var btnQ4Yes: UIButton!
    @IBOutlet weak var btnQ4No: UIButton!
    @IBOutlet weak var btnQ4Dont: UIButton!
    
    private var datePicker: UIDatePicker?
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissSelf))
        
        //date picker
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.preferredDatePickerStyle = .wheels
        datePicker?.addTarget(self, action: #selector(AboutYouFormViewController.dateChanged(datePicker:)), for: .valueChanged)
        textQ5.inputView = datePicker

        //title label
        labelTitle.font = UIFont.rounded(ofSize: 34, weight: .bold)
        
        //label
        labelQ1.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelQ2.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelQ3.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelQ4.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelQ5.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelQ6.font = UIFont.rounded(ofSize: 16, weight: .medium)
        
        //text field Q1
        textQ1.layer.borderColor = UIColor.appColorBlue.cgColor
        textQ1.layer.borderWidth = 1
        
        //text field Q2
        textQ2.layer.borderColor = UIColor.appColorBlue.cgColor
        textQ2.layer.borderWidth = 1
        
        //text field Q3
        textQ5.layer.borderColor = UIColor.appColorBlue.cgColor
        textQ5.layer.borderWidth = 1
        
        //text field Q4
        textQ6.layer.borderColor = UIColor.appColorBlue.cgColor
        textQ6.layer.borderWidth = 1
        
        //btn Q3 yes
        btnQ3Yes.layer.borderWidth = 1
        btnQ3Yes.layer.borderColor = UIColor.appColorBlue.cgColor
        btnQ3Yes.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnQ3Yes.tintColor = UIColor.appColorBlue
        
        //btn Q3 no
        btnQ3No.layer.borderWidth = 1
        btnQ3No.layer.borderColor = UIColor.appColorBlue.cgColor
        btnQ3No.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnQ3No.tintColor = UIColor.appColorBlue
        
        //btn Q3 dont
        btnQ3Dont.layer.borderWidth = 1
        btnQ3Dont.layer.borderColor = UIColor.appColorBlue.cgColor
        btnQ3Dont.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnQ3Dont.tintColor = UIColor.appColorBlue
        
        //btn Q4 yes
        btnQ4Yes.layer.borderWidth = 1
        btnQ4Yes.layer.borderColor = UIColor.appColorBlue.cgColor
        btnQ4Yes.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnQ4Yes.tintColor = UIColor.appColorBlue
        
        //btn Q4 no
        btnQ4No.layer.borderWidth = 1
        btnQ4No.layer.borderColor = UIColor.appColorBlue.cgColor
        btnQ4No.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnQ4No.tintColor = UIColor.appColorBlue
        
        //btn Q4 dont
        btnQ4Dont.layer.borderWidth = 1
        btnQ4Dont.layer.borderColor = UIColor.appColorBlue.cgColor
        btnQ4Dont.titleLabel!.font = UIFont.rounded(ofSize: 14, weight: .bold)
        btnQ4Dont.tintColor = UIColor.appColorBlue
        
        //btn prev next
        btnNext.backgroundColor = UIColor.appColorBlue
        btnNext.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        btnPrev.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        
        //Q3
        btnQ3Yes.addTarget(self, action: #selector(btnClickedQ3Yes(sender:)),for: .touchUpInside)
        btnQ3No.addTarget(self, action: #selector(btnClickedQ3No(sender:)),for: .touchUpInside)
        btnQ3Dont.addTarget(self, action: #selector(btnClickedQ3Dont(sender:)),for: .touchUpInside)
        //Q4
        btnQ4Yes.addTarget(self, action: #selector(btnClickedQ4Yes(sender:)),for: .touchUpInside)
        btnQ4No.addTarget(self, action: #selector(btnClickedQ4No(sender:)),for: .touchUpInside)
        btnQ4Dont.addTarget(self, action: #selector(btnClickedQ4Dont(sender:)),for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AboutYouFormViewController.viewTapped(gestureRecognizer:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        textQ5.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func btnClickedQ3Yes(sender: UIButton!){
        btnNotActive(sender: btnQ3No)
        btnNotActive(sender: btnQ3Dont)
        btnActive(sender: sender)
    }
    @objc func btnClickedQ3No(sender: UIButton!){
        btnNotActive(sender: btnQ3Yes)
        btnActive(sender: sender)
        btnNotActive(sender: btnQ3Dont)
    }
    @objc func btnClickedQ3Dont(sender: UIButton!){
        btnNotActive(sender: btnQ3Yes)
        btnNotActive(sender: btnQ3No)
        btnActive(sender: sender)
    }
    
    @objc func btnClickedQ4Yes(sender: UIButton!){
        btnNotActive(sender: btnQ4No)
        btnNotActive(sender: btnQ4Dont)
        btnActive(sender: sender)
    }
    @objc func btnClickedQ4No(sender: UIButton!){
        btnNotActive(sender: btnQ4Yes)
        btnActive(sender: sender)
        btnNotActive(sender: btnQ4Dont)
    }
    @objc func btnClickedQ4Dont(sender: UIButton!){
        btnNotActive(sender: btnQ4Yes)
        btnNotActive(sender: btnQ4No)
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
