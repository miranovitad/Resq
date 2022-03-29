//
//  OnboardingViewController.swift
//  Resq UiKit
//
//  Created by Refa Satya Pramudhito on 27/07/21.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var ButtonApps: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonApps.layer.borderWidth = 1
        ButtonApps.layer.borderColor = UIColor.white.cgColor
        
    }
}
    

    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        if Core.shared.isNewUser(){
//            let vc = storyboard?.instantiateViewController(identifier: "OnBoardingViewController") as! OnboardingViewController
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true)
//        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
//class Core {
//
//    static let shared = Core()
//
//    func isNewUser() -> Bool{
//        return UserDefaults.standard.bool(forKey: "isNewUser")
//    }
//    func setIsNotNewUser(){
//        UserDefaults.standard.set(true, forKey: "isNewUser")
//    }
//}
