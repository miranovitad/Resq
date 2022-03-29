//
//  Account2ViewController.swift
//  Resq UiKit
//
//  Created by Refa Satya Pramudhito on 27/07/21.
//

import UIKit

class Account2ViewController: UIViewController {
    
    @IBOutlet weak var btnCancel: UIButton!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelBirthday: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var labelEmail: UILabel!

    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textBirthday: UITextField!
    
    @IBOutlet weak var textGender: UITextField!
    @IBOutlet weak var textPhone: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var genderChoose: UITextField!
    private var datePicker: UIDatePicker?
    
    let gender = ["Male", "Female"]
    var pickerView = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textName.layer.borderColor = UIColor.appColorBlue.cgColor
        textPhone.layer.borderColor = UIColor.appColorBlue.cgColor
        textEmail.layer.borderColor = UIColor.appColorBlue.cgColor
        textGender.layer.borderColor = UIColor.appColorBlue.cgColor
        textBirthday.layer.borderColor = UIColor.appColorBlue.cgColor
        
        textName.layer.borderWidth = 1
        textPhone.layer.borderWidth = 1
        textEmail.layer.borderWidth = 1
        textGender.layer.borderWidth = 1
        textBirthday.layer.borderWidth = 1
        
        btnCancel.tintColor = UIColor.appColorBlue
        btnCancel.titleLabel?.font = UIFont.rounded(ofSize: 17, weight: .bold)
        
        labelName.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelBirthday.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelGender.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelPhone.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelEmail.font = UIFont.rounded(ofSize: 16, weight: .medium)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        genderChoose.inputView = pickerView
        
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(Account2ViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(Account2ViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        inputTextField.inputView = datePicker
        datePicker?.preferredDatePickerStyle = .wheels
        
        // Do any additional setup after loading the view.
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        inputTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
        @IBAction func cancelButton(_ sender: UIButton) {
            self.dismiss(animated: true, completion: nil)
        }
        @IBAction func doneButton(_ sender: UIButton) {
            self.dismiss(animated: true, completion: nil)
        }

}
extension Account2ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderChoose.text = gender[row]
        genderChoose.resignFirstResponder()
    }
}
