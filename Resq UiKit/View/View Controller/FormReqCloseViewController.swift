//
//  FormReqOpenViewController.swift
//  Resq UiKit
//
//  Created by Mira Novita Dewi Ni Putu on 28/07/21.
//

import UIKit

class FormReqCloseViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var btnDone: UIButton!
    
    @objc private func dismissSelf(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissSelf))

        //btn prev next
        btnDone.backgroundColor = UIColor.appColorBlue
        btnDone.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        
        labelTitle.font = UIFont.rounded(ofSize: 18, weight: .bold)
        
        labelDesc.textColor = UIColor.appColorDarkGrey
        labelDesc.font = UIFont.rounded(ofSize: 15, weight: .regular)
        labelDesc.setLineSpacing(lineSpacing: 1.5)
        labelDesc.textAlignment = .center
        
        
        
    }
    @IBAction func btnClicked(_ sender: UIButton) {
        showAlert()
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Succeed", message: "Your adoption request will be processed soon, you can see the progress of your adoption in the profile tab", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { action in
            self.dismissSelf()
        }))
        
        present(alert, animated: true)
    }
}

