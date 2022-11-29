//
//  FirebaseService.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 22/11/22.
//

import Foundation
import FirebaseFirestore

class FirebaseService {
    
    static func addProductToCart(product: Product) {
        var db = Firestore.firestore()

//        db.collection("cart").addDocument(data: ["\(product.id)" : product]) { error in
//            print("Error while adding doc")
//        }
      }
}
