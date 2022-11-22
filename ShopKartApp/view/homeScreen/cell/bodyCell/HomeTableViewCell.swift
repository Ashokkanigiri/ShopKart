//
//  HomeTableViewCell.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 18/11/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    var productClickedHandler: ProductclickedHandler? = nil
    
    var productId: Int = 0
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productTitle: UILabel!
    
    @IBAction func cellClickedHandler(_ sender: UIButton) {
        
        productClickedHandler?.onProductClicked(productId: productId)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
