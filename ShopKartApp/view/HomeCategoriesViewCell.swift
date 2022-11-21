//
//  HomeCategoriesViewCell.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 18/11/22.
//

import UIKit
import Hero

class HomeCategoriesViewCell: UITableViewCell {
    
    @IBOutlet weak var eb: UIButton!
    
    var categoryClickedHandler: CategoryClickedHandler? = nil

    @IBAction func electronicsCategoryClickedHandler(_ sender: UIButton) {
       
        eb.hero.id = "ironMan"
        categoryClickedHandler?.onCategoryClicked(category: "electronics")
    }

    @IBAction func JeweleryCategoryClickedHandler(_ sender: UIButton) {
        categoryClickedHandler?.onCategoryClicked(category: "jewelery")
    }
    
    @IBAction func MenClothingClickedHandler(_ sender: UIButton) {
        categoryClickedHandler?.onCategoryClicked(category: "men's clothing")
    }
    
    @IBAction func WomenClothingClickedHandler(_ sender: UIButton) {
        categoryClickedHandler?.onCategoryClicked(category: "women's clothing")
    }
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
