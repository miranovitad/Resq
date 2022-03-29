//
//  UserProfileViewController.swift
//  Resq UiKit
//
//  Created by Refa Satya Pramudhito on 26/07/21.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var SettingButton: UIButton!
    
    @IBOutlet weak var labelTitle1: UILabel!
    @IBOutlet weak var labelTitle2: UILabel!
    @IBOutlet weak var labelProg1: UILabel!
    @IBOutlet weak var labelProg2: UILabel!
    @IBOutlet weak var labelProg3: UILabel!
    
    @IBOutlet weak var petCollectionView: UICollectionView!

    override func viewDidLoad() {
        petCollectionView.delegate = self
        petCollectionView.dataSource = self
        
        labelTitle1.font = UIFont.rounded(ofSize: 18, weight: .bold)
        labelTitle2.font = UIFont.rounded(ofSize: 18, weight: .bold)
        labelProg1.font = UIFont.rounded(ofSize: 13, weight: .medium)
        labelProg2.font = UIFont.rounded(ofSize: 13, weight: .medium)
        labelProg3.font = UIFont.rounded(ofSize: 13, weight: .medium)
    }
    
    @IBAction func settingButtonClicked(_ sender: UIButton) {
        
    }
    
    var dogData = [ UIImage(named: "Bailey"),
                    UIImage(named: "Cappie"),
                    UIImage(named: "Magie"),
                    UIImage(named: "Oreo")
    ]
    
    var cardNamesArray:[String] = ["Bailey","Cappie","Maggie","Oreo","card5","card6","card7","card8","card9","card10","card11","card12","card13"]
    //    var progressView: VerticalProgressView = {
    //        let pv = VerticalProgressView()
    //        pv.translatesAutoresizingMaskIntoConstraints = false
    //        return pv
    //    }()
    //
    //        override func viewDidLoad() {
    //            super.viewDidLoad()
    //            setupViews()
    //        }
    //    private func setupViews() {
    //        view.addSubview(progressView)
    //        progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    //        progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    //        progressView.widthAnchor.constraint(equalToConstant: 30).isActive = true
    //        progressView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    //
    //    }
}
extension UserProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = petCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PetCollectionViewCell
        cell.petCollection.image = dogData[indexPath.row]
        cell.dogName.text = cardNamesArray[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("Sizeee")
        return CGSize(width: 300, height: 500)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "PetInfoDetails", bundle: nil)
        let destination = storyboard.instantiateViewController(identifier: "PetInfoDetailsViewController") as! PetInfoDetailsViewController
        self.navigationController?.pushViewController(destination, animated: true)

//        destination.modalPresentationStyle = .fullScreen
//        self.present(destination, animated: true, completion: nil)
        
//        guard let Settings = storyboard.instantiateViewController(withIdentifier: "PetInfoDetailsViewController") as? PetInfoDetailsViewController else
//        {fatalError("Failed on getting the Page")}
//                collectionView.deselectRow(at: indexPath, animated: true)
//                self.navigationController?.pushViewController(Settings, animated: true)
//        self.present(Settings, animated: true, completion: nil)
    }
}
