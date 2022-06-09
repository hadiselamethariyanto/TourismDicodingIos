//
//  TourismTableViewCell.swift
//  TourismDicoding
//
//  Created by MuhammadHariyanto on 08/06/22.
//

import UIKit

class TourismTableViewCell: UITableViewCell {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tourismImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
