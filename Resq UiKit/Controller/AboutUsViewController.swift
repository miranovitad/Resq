//
//  AboutUsViewController.swift
//  Resq UiKit
//
//  Created by Refa Satya Pramudhito on 21/07/21.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var dogSex: UILabel!
    @IBOutlet weak var dogAge: UILabel!
    @IBOutlet weak var communityName: UILabel!
    @IBOutlet weak var dogLocation: UILabel!
    @IBOutlet weak var vaccineStatus: UILabel!
    @IBOutlet weak var dogDescription: UILabel!
    
    @IBOutlet weak var labelParagraf1: UILabel!
    @IBOutlet weak var labelSlogan: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelParagraf1.font = UIFont.rounded(ofSize: 16, weight: .regular)
        labelParagraf1.setLineSpacing(lineSpacing: 2)
        labelParagraf1.textAlignment = .justified
        labelSlogan.font = UIFont.rounded(ofSize: 20, weight: .bold)
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
