//
//  CategoryDetailRepository.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 21/11/22.
//

import Foundation
import Alamofire

class ProductListRepository {
    
    var categoryDetailClickedHandler : ProductListClickHandler? = nil
    
    func getAllProductsByCategory(categoryName: String) {
        let url = "https://fakestoreapi.com/products/category/" + categoryName
        print("URL ::  \(url)")
        AF.request(url).validate().responseDecodable(of: Array<Product>.self) { response in
            do {
               let data = try response.result.get()
                self.categoryDetailClickedHandler?.getAllProductsByCategory(productsList: data)
            } catch {
                print(error)
            }
        }
    }
}
