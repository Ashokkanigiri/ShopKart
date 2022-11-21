//
//  HomeDataRepository.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 18/11/22.
//

import Foundation

protocol HomeDataRepository {
    func loadAllProducts(productsList : Array<Product>)
}
