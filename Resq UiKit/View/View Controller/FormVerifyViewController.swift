//
//  FormVerifyViewController.swift
//  Resq UiKit
//
//  Created by Mira Novita Dewi Ni Putu on 26/07/21.
//

import UIKit

class FormVerifyViewController: UIViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var btnChoose: UIButton!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissSelf))
        
        labelTitle.font = UIFont.rounded(ofSize: 18, weight: .bold)
    
        btnChoose.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        btnChoose.setTitleColor(UIColor.appColorBlue, for: .normal)
        btnChoose.tintColor = UIColor.appColorBlue
        btnChoose.layer.borderWidth = 1
        btnChoose.layer.borderColor = UIColor.appColorBlue.cgColor
        
        labelDesc.textColor = UIColor.appColorDarkGrey
        labelDesc.font = UIFont.rounded(ofSize: 15, weight: .regular)
        labelDesc.setLineSpacing(lineSpacing: 1.5)
        labelDesc.textAlignment = .center
        
        btnNext.backgroundColor = UIColor.appColorBlue
        btnNext.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        
        btnPrev.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        
    }
    
    @IBAction func chooseImage(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            imagePickerController.allowsEditing = true
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion:{
                    imagePickerController.delegate = self
                })
            }else{
                print("Camera not available!")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
            self.present(imagePickerController, animated: true, completion:{
                imagePickerController.delegate = self
            })
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {(action: UIAlertAction) in
            
        }))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FormVerifyViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else{
            return
        }
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
