//
//  CategoryDetailViewController.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 21/11/22.
//

import UIKit

class CategoryDetailViewController : UIViewController , CategoryDetailClickedHandler{
    
    var productsList: Array<Product>? = nil
    var categoryDetailName : String? = nil
    var repo = CategoryDetailRepository()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        registerViews()
        tableView.dataSource = self
        navigationItem.title = categoryDetailName
        repo.categoryDetailClickedHandler = self
        repo.getAllProductsByCategory(categoryName: (categoryDetailName ?? "").lowercased())
        
    }
    
    func registerViews(){
        tableView.register(UINib(nibName: "CategoryDetailCell", bundle: nil), forCellReuseIdentifier: "categoryDetailCell")
    }
    
    func productClicked(productId: Int) {
        
    }
    
    func getAllProductsByCategory(productsList: Array<Product>) {
        self.productsList = productsList
        tableView.reloadData()
    }
    
}

extension CategoryDetailViewController : UITableViewDataSource{
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "categoryDetailCell", for: indexPath) as! CategoryDetailCell
        
        cell.productTitle.text = productsList?[indexPath.row].title
        cell.priceTitle.text = "\(productsList?[indexPath.row].price)"
        cell.productImageView?.loadImage(urlString: (productsList?[indexPath.row].image)!)
        
        return cell
    }

}
