//
//  CategoryDetailViewController.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 21/11/22.
//

import UIKit

class ProductListViewController : UIViewController , ProductListClickHandler{
    
    var productsList: Array<Product>? = nil
    var categoryDetailName : String? = nil
    var selectedProductId: Int = 0
    var repo = ProductListRepository()
    
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
    
    func onProductClicked(productId: Int) {
        selectedProductId = productId
        self.performSegue(withIdentifier: "navigateToProductDetail", sender: self)
    }
    
    func getAllProductsByCategory(productsList: Array<Product>) {
        self.productsList = productsList
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "navigateToProductDetail"){
            var vc = segue.destination as! ProductDetailViewController
            vc.selectedProductId = self.selectedProductId
        }
    }
    
}



extension ProductListViewController : UITableViewDataSource{
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "categoryDetailCell", for: indexPath) as! CategoryDetailCell
        
        cell.productListClickHandler = self
        
        cell.productId = productsList?[indexPath.row].id ?? 0
        
        cell.productTitle.text = productsList?[indexPath.row].title
        
        if let productPrice = productsList?[indexPath.row].price {
            cell.priceTitle.text = "\(productPrice)"
        }
        
        cell.productImageView?.loadImage(urlString: (productsList?[indexPath.row].image)!)
        
        return cell
    }

}
