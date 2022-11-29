//
//  ViewController.swift
//  ShopKartApp
//
//  Created by Ashok Kanigiri on 18/11/22.
//

import UIKit

class HomeViewController: UIViewController, HomeDataRepository, CategoryClickedHandler, ProductclickedHandler {
    
    var selectedProductId = 0
        
    @IBOutlet weak var homeTableView: UITableView!
    
    var homeDataRepoImpl : HomeDataRepositoryImpl = HomeDataRepositoryImpl()
    
    var productsList: Array<Product>? = nil
    
    var selectedCategoryName : String? = nil
    
    
    func loadAllProducts(productsList: Array<Product>) {
        self.productsList = productsList
        homeTableView.reloadData()
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
                        
        homeDataRepoImpl.homeDataRepo = self
        homeDataRepoImpl.getAllProducts()
        
        registerHomeDataView()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == AppConstants.NavigationConstants.CATEGORY_DETAIL_NAVIGATION){
            (segue.destination as! ProductListViewController).categoryDetailName = selectedCategoryName
        } else if (segue.identifier == "homeToProductDetail"){
            var vc = segue.destination as! ProductDetailViewController
            vc.selectedProductId = selectedProductId
        }
        
    }
    
    func registerHomeDataView(){
        homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "homeTableViewCell")
        
        homeTableView.register(UINib(nibName: "HomeCategoriesViewCell", bundle: nil), forCellReuseIdentifier: "homeCategoriesViewCell")
        
        homeTableView.dataSource = self
    }
    
    func onCategoryClicked(category: String) {
        selectedCategoryName = category
        self.performSegue(withIdentifier: AppConstants.NavigationConstants.CATEGORY_DETAIL_NAVIGATION, sender: self)
        
    }
    
    func onProductClicked(productId: Int) {
        self.selectedProductId = productId
        self.performSegue(withIdentifier: "homeToProductDetail", sender: self)
    }


}


extension HomeViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeCategoriesViewCell", for: indexPath) as! HomeCategoriesViewCell
            
            cell.categoryClickedHandler = self
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        cell.productTitle.text = productsList?[indexPath.row].title
        cell.productImageView?.loadImage(urlString: productsList?[indexPath.row].image ?? "")
        
        cell.productId = productsList?[indexPath.row].id ?? 0
        cell.productClickedHandler = self
       
        
        return cell
        
    }
}

