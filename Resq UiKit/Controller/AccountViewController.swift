//
//  AccountViewController.swift
//  Resq UiKit
//
//  Created by Refa Satya Pramudhito on 27/07/21.
//

import UIKit

class AccountViewController: UIViewController {
    @IBOutlet weak var labelNama: UILabel!
    @IBOutlet weak var labelBirthday: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var Nama: UILabel!
    @IBOutlet weak var Birthday: UILabel!
    @IBOutlet weak var Gender: UILabel!
    @IBOutlet weak var Phone: UILabel!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var labelEdit: UIButton!
    @IBOutlet weak var logout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Nama.font = UIFont.rounded(ofSize: 17, weight: .bold)
        Birthday.font = UIFont.rounded(ofSize: 17, weight: .bold)
        Gender.font = UIFont.rounded(ofSize: 17, weight: .bold)
        Phone.font = UIFont.rounded(ofSize: 17, weight: .bold)
        Email.font = UIFont.rounded(ofSize: 17, weight: .bold)
        
        labelNama.font = UIFont.rounded(ofSize: 14, weight: .bold)
        labelBirthday.font = UIFont.rounded(ofSize: 14, weight: .bold)
        labelGender.font = UIFont.rounded(ofSize: 14, weight: .bold)
        labelPhone.font = UIFont.rounded(ofSize: 14, weight: .bold)
        labelEmail.font = UIFont.rounded(ofSize: 14, weight: .bold)
        
        labelEdit.tintColor = UIColor.appColorBlue
        labelEdit.titleLabel?.font = UIFont.rounded(ofSize: 17, weight: .bold)
        
        logout.tintColor = UIColor.appColorBlue
        logout.titleLabel?.font = UIFont.rounded(ofSize: 17, weight: .bold)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
