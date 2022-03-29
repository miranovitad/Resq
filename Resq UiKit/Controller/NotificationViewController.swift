//
//  NotificationViewController.swift
//  Resq UiKit
//
//  Created by Refa Satya Pramudhito on 19/07/21.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var labelTitle1: UILabel!
    @IBOutlet weak var labelTitle2: UILabel!
    
    @IBOutlet weak var labelKet1: UILabel!
    @IBOutlet weak var labelKet2: UILabel!
    @IBOutlet weak var labelKet3: UILabel!
    @IBOutlet weak var labelKet4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle1.font = UIFont.rounded(ofSize: 18, weight: .bold)
        labelTitle2.font = UIFont.rounded(ofSize: 18, weight: .bold)
        labelKet1.font = UIFont.rounded(ofSize: 15, weight: .medium)
        labelKet2.font = UIFont.rounded(ofSize: 15, weight: .medium)
        labelKet3.font = UIFont.rounded(ofSize: 15, weight: .medium)
        labelKet4.font = UIFont.rounded(ofSize: 15, weight: .medium)
    }
}
