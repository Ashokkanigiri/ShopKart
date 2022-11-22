//
//  ProductDetailRepository.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 22/11/22.
//

import Foundation
import Alamofire

class ProductDetailRepository {
    
    var productDetailProtocol : ProductDetailDataProtocol? = nil
    
    func getProductDetail(productId: Int) {
        AF.request("https://fakestoreapi.com/products/\(productId)").validate().responseDecodable(of: Product.self) { response in
            do {
               let data = try response.result.get()
                self.productDetailProtocol?.getProductDetail(product: data)
            } catch {
                print(error)
            }
        }
    }
}
