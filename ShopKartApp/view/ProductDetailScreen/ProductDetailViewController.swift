//
//  ProductDetailViewController.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 22/11/22.
//

import Foundation
import UIKit

class ProductDetailViewController : UIViewController, ProductDetailDataProtocol{
 
    
    var productDetailRepository = ProductDetailRepository()
    
    var selectedProductId: Int = 0
    
    @IBOutlet weak var productTitleLabel: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
 
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    func getProductDetail(product: Product) {
        productTitleLabel.text = product.title
        productImage.loadImage(urlString: product.image)
        productPriceLabel.text = "Rs. \(product.price)"
        productDescriptionLabel.text = product.whetherAPIByCityResponseDescription
    }
    
    override func viewDidLoad() {
        productDetailRepository.productDetailProtocol = self
        productDetailRepository.getProductDetail(productId: selectedProductId)
    }
}
