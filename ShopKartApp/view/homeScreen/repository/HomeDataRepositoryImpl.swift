//
//  HomeDataRepository.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 18/11/22.
//

import Foundation
import Alamofire

struct HomeDataRepositoryImpl  {
    
    var homeDataRepo : HomeDataRepository? = nil
    
    func getAllProducts() {
        AF.request("https://fakestoreapi.com/products").validate().responseDecodable(of: Array<Product>.self) { response in
            do {
               let data = try response.result.get()
                homeDataRepo?.loadAllProducts(productsList: data)
            } catch {
                print(error)
            }
        }
    }
    
}
