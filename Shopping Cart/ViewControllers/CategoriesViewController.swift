//
//  CategoriesViewController.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 13/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import UIKit
import RealmSwift


protocol CategoriesControllerOutput {
    func loadProducts()
}

protocol CategoriesControllerInput {
    func showCategories()
    func showMessage()
}

class CategoriesViewController: UIViewController {
    
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!

    @IBOutlet weak var noDataLabel: UILabel!
    
    
    var output: CategoriesControllerOutput!
    var router: CategoriesRouter!
    
    
    var dataProducts = [Products]()
    var filteredProducts = [Products]()
    var categories = [String]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CategoriesConfigurator.sharedInstance.configure(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.output.loadProducts()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private struct CategoryIdentifier
    {
        static let tableViewCellIdentifier = "categoryTableViewCell"
         static let collectionViewCellIdentifier = "categoryCollectionViewCell"
    }
    
    func showCategories(products: [Products]) {
        saveProducts(products)
        self.dataProducts = readProducts()
        categories = Array(Set(self.dataProducts.map({$0.category!})))
        self.categoryTableView.reloadData()
        self.categoryCollectionView.reloadData()
        
    }
    
    func showMessage(message: String, messageType: MessageType) {
        router.pushToProducts()
    }
    
    func saveProducts(products: [Products]){
     if products.count > 0 {
        products.forEach { (product) in
            let realm = try! Realm()
            try! realm.write {
                realm.add(product,update: true)
            }
        }
        }
    }
    
    func readProducts() -> [Products]{
         let realm = try! Realm()
         return Array(realm.objects(Products))
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.categories.count < 1) {
            noDataLabel.hidden = false
            self.categoryTableView.hidden = true
        }else {
            noDataLabel.hidden = true
            self.categoryTableView.hidden = false
        }
        return self.categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: CategoryTableViewCell = tableView.dequeueReusableCellWithIdentifier(CategoryIdentifier.tableViewCellIdentifier) as! CategoryTableViewCell
        cell.categoryName = self.categories[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        filteredProducts = dataProducts.filter({$0.category == self.categories[indexPath.row]})
        router.pushToProducts()
    }
    
}

extension CategoriesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(self.categories.count < 1) {
            noDataLabel.hidden = false
            self.categoryCollectionView.hidden = true
        }else {
            noDataLabel.hidden = true
            self.categoryCollectionView.hidden = false
        }
        return self.categories.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CategorieCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(CategoryIdentifier.collectionViewCellIdentifier, forIndexPath: indexPath) as! CategorieCollectionViewCell
        
        cell.categoryName = self.categories[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        filteredProducts = dataProducts.filter({$0.category == self.categories[indexPath.row]})
        router.pushToProducts()
    }
}
