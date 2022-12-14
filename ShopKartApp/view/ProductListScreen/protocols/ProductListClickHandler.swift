//
//  CategoryDetailClickedHandler.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 21/11/22.
//

import Foundation

protocol ProductListClickHandler {
    func onProductClicked(productId: Int)
    func getAllProductsByCategory(productsList : Array<Product>)
}
