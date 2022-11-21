//
//  CategoryDetailCell.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 21/11/22.
//

import UIKit

class CategoryDetailCell: UITableViewCell {

    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var priceTitle: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
