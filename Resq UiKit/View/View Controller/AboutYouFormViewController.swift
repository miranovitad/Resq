//
//  AboutYouFormViewController.swift
//  Resq UiKit
//
//  Created by Mira Novita Dewi Ni Putu on 23/07/21.
//

import UIKit

class CellClass: UITableViewCell {
    
}

class AboutYouFormViewController: UIViewController, UIScrollViewDelegate{
    
    
    @IBOutlet weak var textDob: UITextField!
    private var datePicker: UIDatePicker?
    @IBOutlet weak var labelDob: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var labelNationality: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    
    //textField
    @IBOutlet weak var textFirstName: UITextField!
    @IBOutlet weak var textLastName: UITextField!
    @IBOutlet weak var textArea: UITextField!
    @IBOutlet weak var textPhone: UITextField!
    @IBOutlet weak var textAddress: UITextField!
    @IBOutlet weak var textCity: UITextField!
    @IBOutlet weak var textState: UITextField!
    @IBOutlet weak var textZipCode: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    
    //pick nationality
    @IBOutlet weak var textNationality: UITextField!
    
    let nationality = ["Indonesia", "Australia", "Japan", "Malaysia"]
    var pickerView = UIPickerView()
    
    let transparentView = UIView()
    let tableView = UITableView()
    var dataSource = [String]()
    var selectedButton = UIButton()
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        textNationality.inputView = pickerView
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissSelf))
        
        //title form
        labelTitle.font = UIFont.rounded(ofSize: 34, weight: .bold)
        labelName.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelDob.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelPhone.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelNationality.font = UIFont.rounded(ofSize: 16, weight: .medium)
        labelAddress.font = UIFont.rounded(ofSize: 16, weight: .medium)
        
        //textfield
        textFirstName.layer.borderColor = UIColor.appColorBlue.cgColor
        textFirstName.layer.borderWidth = 1
        textLastName.layer.borderColor = UIColor.appColorBlue.cgColor
        textLastName.layer.borderWidth = 1
        textDob.layer.borderColor = UIColor.appColorBlue.cgColor
        textDob.layer.borderWidth = 1
        textArea.layer.borderColor = UIColor.appColorBlue.cgColor
        textArea.layer.borderWidth = 1
        textPhone.layer.borderColor = UIColor.appColorBlue.cgColor
        textPhone.layer.borderWidth = 1
        textAddress.layer.borderColor = UIColor.appColorBlue.cgColor
        textAddress.layer.borderWidth = 1
        textCity.layer.borderColor = UIColor.appColorBlue.cgColor
        textCity.layer.borderWidth = 1
        textState.layer.borderColor = UIColor.appColorBlue.cgColor
        textState.layer.borderWidth = 1
        textZipCode.layer.borderColor = UIColor.appColorBlue.cgColor
        textZipCode.layer.borderWidth = 1
        textNationality.layer.borderWidth = 1
        textNationality.layer.borderColor = UIColor.appColorBlue.cgColor
        
        btnNext.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        btnNext.backgroundColor = UIColor.appColorBlue
        
        //datepicker
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.preferredDatePickerStyle = .wheels
        datePicker?.addTarget(self, action: #selector(AboutYouFormViewController.dateChanged(datePicker:)), for: .valueChanged)
        textDob.inputView = datePicker
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AboutYouFormViewController.viewTapped(gestureRecognizer:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        textDob.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension AboutYouFormViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nationality.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return nationality[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        textNationality.text = nationality[row]
        textNationality.resignFirstResponder()
    }
}



