//
//  RestClient.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 18/11/22.
//

import Foundation
import Alamofire

struct RestClient{
    
    static func request(){
        AF.request("https://fakestoreapi.com/products").validate().responseDecodable(of: Array<Product>.self) { response in
        }
    }
    
    static func getProductsForCategory(){
        AF.request("https://fakestoreapi.com/products/category/jewelery").validate()
            .responseDecodable(of: Array<Product>.self) { response in
            }
    }
}
