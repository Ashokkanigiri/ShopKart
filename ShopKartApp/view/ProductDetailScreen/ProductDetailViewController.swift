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
    
    @IBOutlet weak var starImg_1: UIImageView!
    
    @IBOutlet weak var starImg_3: UIImageView!
    
    @IBOutlet weak var starImg_2: UIImageView!
    
    @IBOutlet weak var starImg_4: UIImageView!
    
    @IBOutlet weak var starImg_5: UIImageView!
    
    func getProductDetail(product: Product) {
        productTitleLabel.text = product.title
        productImage.loadImage(urlString: product.image)
        productPriceLabel.text = "Rs. \(product.price)"
        productDescriptionLabel.text = product.whetherAPIByCityResponseDescription
        loadRatings(rating: product.rating.rate)
    }
    
    override func viewDidLoad() {
        refreshRating()
        productDetailRepository.productDetailProtocol = self
        productDetailRepository.getProductDetail(productId: selectedProductId)
    }
    
    func refreshRating(){
        starImg_1.image = UIImage(named: "star")
        starImg_2.image = UIImage(named: "star")
        starImg_3.image = UIImage(named: "star")
        starImg_4.image = UIImage(named: "star")
        starImg_5.image = UIImage(named: "star")
    }
    
    func loadRatings(rating: Double){
        print(rating)
    switch rating {
        case 1.0 ... 1.9:
            starImg_1.image = UIImage(named: "star.fill")
            
        case 2.0 ... 2.9:
            starImg_1.image = UIImage(named: "star.fill")
            starImg_2.image = UIImage(named: "star.fill")
            
        case 3.0 ... 3.9:
            starImg_1.image = UIImage(named: "star.fill")
            starImg_2.image = UIImage(named: "star.fill")
            starImg_3.image = UIImage(named: "star.fill")
            
        case 4.0 ... 5.0:
            starImg_1.image = UIImage(named: "star.fill")
            starImg_2.image = UIImage(named: "star.fill")
            starImg_3.image = UIImage(named: "star.fill")
            starImg_4.image = UIImage(named: "star.fill")
            starImg_5.image = UIImage(named: "star.fill")
            
        default :
            starImg_1.image = UIImage(named: "star.fill")
            starImg_2.image = UIImage(named: "star.fill")
            starImg_3.image = UIImage(named: "star.fill")
            starImg_4.image = UIImage(named: "star.fill")
    
    }
 }
}
