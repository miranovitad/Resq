//
//  AdoptionCollectionViewCell.swift
//  Resq UiKit
//
//  Created by Bryan Khufa on 15/07/21.
//

import UIKit

class AdoptionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var petGender: UILabel!
    @IBOutlet weak var petAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        petImage.layer.cornerRadius = 10
        petImage.layer.masksToBounds = true
    }

}
