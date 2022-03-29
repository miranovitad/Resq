//
//  HelpViewController.swift
//  Resq UiKit
//
//  Created by Refa Satya Pramudhito on 21/07/21.
//

import UIKit

class HelpViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var Email: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        Email.layer.borderWidth = 1
        Email.layer.borderColor = UIColor.appColorBlue.cgColor
        labelTitle.font = UIFont.rounded(ofSize: 18, weight: .bold)
        Email.titleLabel?.font = UIFont.rounded(ofSize: 16, weight: .medium)
        // Do any additional setup after loading the view.
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
