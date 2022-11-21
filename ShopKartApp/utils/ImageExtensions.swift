//
//  ImageExtensions.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 18/11/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImage(urlString: String){
        guard let url = URL(string: urlString) else {
            return
        }
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.image = loadedImage
                    }
                }
            }
        }
    }
    
}
