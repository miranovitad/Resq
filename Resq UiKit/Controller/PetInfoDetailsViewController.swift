//
//  PetInfoDetailsViewController.swift
//  Resq UiKit
//
//  Created by Refa Satya Pramudhito on 15/07/21.
//

import UIKit

class PetInfoDetailsViewController: UIViewController, UIPageViewControllerDelegate{
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var dogGender: UILabel!
    @IBOutlet weak var dogAge: UILabel!
    @IBOutlet weak var communityName: UILabel!
    @IBOutlet weak var dogLocation: UILabel!
    @IBOutlet weak var vaccineStatus: UILabel!
    @IBOutlet weak var dogDescription: UILabel!
    @IBOutlet weak var loveButtonLogo: UIButton!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var btnAdoptme: UIButton!
    
    @IBAction func Dismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    var Love = false
    var currentCellIndex = 0
    var dogData = [ UIImage(named: "Bailey"),
                    UIImage(named: "Cappie"),
                    UIImage(named: "Magie"),
                    UIImage(named: "Oreo"),
                    UIImage(named: "Brans"),
                    UIImage(named: "Clarissa"),
                    UIImage(named: "Donkey"),
                    UIImage(named: "Gatusso"),
                    UIImage(named: "Ihsan"),
                    UIImage(named: "Jean"),
                    UIImage(named: "Joni"),
                    UIImage(named: "Merlin"),
                    UIImage(named: "Silly")

    ]
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view edit 
        dogName.font = UIFont.rounded(ofSize: 34, weight: .bold)
        
        dogGender.textColor = UIColor.appColorDarkGrey
        dogGender.font = UIFont.rounded(ofSize: 18, weight: .medium)
        
        dogAge.textColor = UIColor.appColorDarkGrey
        dogAge.font = UIFont.rounded(ofSize: 18, weight: .medium)
        
        dogDescription.font = UIFont.rounded(ofSize: 15, weight: .regular)
        dogDescription.setLineSpacing(lineSpacing: 1.5)
        
        btnAdoptme.backgroundColor = UIColor.appColorBlue
        btnAdoptme.titleLabel!.font = UIFont.rounded(ofSize: 18, weight: .bold)
        
        
        
//        abelTitle.font = UIFont.rounded(ofSize: 18, weight: .bold)
//
//        labelDesc.textColor = UIColor.appColorDarkGrey
//        labelDesc.font = UIFont.rounded(ofSize: 15, weight: .regular)
//        labelDesc.setLineSpacing(lineSpacing: 1.5)
//        labelDesc.textAlignment = .center
        
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        configureData()
        
        //        let vc = PetInfoDetailsViewController(nibName: "PetInfoDetailsViewController", bundle: nil)
        //        self.present(vc, animated: true)
        
        //        self.dismiss(animated: true, completion: nil)
        //          Kalau butuh close controller
    }
    
    func configureData() {
        dogName?.text = dogFile.dogName
        dogGender?.text = dogFile.dogSex
        dogAge?.text = "\(dogFile.dogAge) years"
        communityName?.text = dogFile.communityName
        dogLocation?.text = dogFile.dogLocation
        vaccineStatus?.text = dogFile.vaccineStatus
        dogDescription?.text = dogFile.dogDescription
    }
    
    @objc func slideToNext(){
        if currentCellIndex < dogData.count-1 {
            currentCellIndex = currentCellIndex + 1
            print("asdasd")
        }
        else {
            currentCellIndex = 0
            print("Index")
        }
        sliderCollectionView?.isPagingEnabled = false
        sliderCollectionView?.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true )
        print("Jalan")
        sliderCollectionView?.isPagingEnabled = true

    }
    
    @IBAction func adoptButton(_ sender: UIButton) {
        sender.animateButtonDown()
        //        sender.animateButtonUp()
        
    }
    
    @IBAction func loveButton(_ sender: UIButton) {
        if (Love == false){
            sender.setBackgroundImage((UIImage(systemName: "heart.fill")), for: UIControl.State.normal)
            sender.tintColor = UIColor.appColorBlue
            Love = true
            sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            
            UIView.animate(withDuration: 2.0,
                           delay: 0,
                           usingSpringWithDamping: CGFloat(0.20),
                           initialSpringVelocity: CGFloat(6.0),
                           options: UIView.AnimationOptions.allowUserInteraction,
                           animations: {
                            sender.transform = CGAffineTransform.identity
                           },
                           completion: { Void in()  }
            )
            print("Sudah 1x")
        }
        else {
            sender.setBackgroundImage((UIImage(systemName: "heart")), for: UIControl.State.normal)
            sender.tintColor = UIColor.appColorBlue
            Love = false
            print("Kembali 1x")
        }
    }
    
    
    var dogFile =
        DogFile (dogImage: "Bailey",
                 dogName: "Alam",
                 dogSex: "Female",
                 dogAge: "3 Years",
                 dogLocation: "Surabaya",
                 vaccineStatus: "Vaccinated",
                 communityName: "Paws Rescuer",
                 dogDescription: "Micky was found out the front of a notorious Dog Meat Restaurant in Bali. She was frail, scared and alone. She was being tormented by a young boy who threw rocks at, until we stepped in.")
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
}

//UIImage(named: "\(dogData[indexPath.row].myImage)")

extension PetInfoDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionView
        cell.myImage.image = dogData[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("test")
        return CGSize(width: 100, height: 100)
        //        return CGSize(width: sliderCollectionView.frame.width, height: sliderCollectionView.frame.height)
    }
    
}

extension UIView {
    
    func animateButtonDown() {
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseIn], animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: nil)
    }
    
    func animateButtonUp() {
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}


