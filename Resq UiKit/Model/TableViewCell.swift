//
//  TableViewCell.swift
//  Resq UiKit
//
//  Created by Refa Satya Pramudhito on 19/07/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var tableViewLogo: UIImageView!
    @IBOutlet weak var tableViewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableViewLabel.font = UIFont.rounded(ofSize: 17, weight: .medium)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
