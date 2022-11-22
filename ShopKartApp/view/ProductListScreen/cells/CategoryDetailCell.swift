//
//  CategoryDetailCell.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 21/11/22.
//

import UIKit

class CategoryDetailCell: UITableViewCell {
    
    var productListClickHandler: ProductListClickHandler? = nil
    
    var productId: Int = 0
    
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var priceTitle: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBAction func mainContentClickHandler(_ sender: UIButton) {
        
        productListClickHandler?.onProductClicked(productId: self.productId)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
