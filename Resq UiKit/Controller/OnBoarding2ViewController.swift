//
//  OnBoarding2ViewController.swift
//  Resq UiKit
//
//  Created by Mira Novita Dewi Ni Putu on 30/07/21.
//

import UIKit

class OnBoarding2ViewController: UIViewController {
    
    @IBOutlet weak var buttonApps: UIButton!
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var labelB: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonApps.layer.borderWidth = 1
        buttonApps.layer.borderColor = UIColor.white.cgColor
        
        labelA.font = UIFont.rounded(ofSize: 16, weight: .bold)
        labelB.font = UIFont.rounded(ofSize: 16, weight: .bold)

        // Do any additional setup after loading the view.
    }
}
