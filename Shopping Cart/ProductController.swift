//
//  ViewController.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 10/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import UIKit

protocol ProductControllerOutput {
}

protocol ProductControllerInput {
    func showMessage(message: String,messageType:MessageType)
}

class ProductController: UICollectionViewController{

    var output: ProductControllerOutput!
    var router: ProductRouter!
    
    var products = [Products]()
    var selectedProduct =  Products()
    var categories = [String]()
    
    private let leftAndRightPaddings: CGFloat = 32.0
    private let numberOfItemsPerRow: CGFloat = 3.0
    private let heigthAdjustment: CGFloat = 30.0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ProductConfigurator.sharedInstance.configure(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = (CGRectGetWidth(collectionView!.frame) - leftAndRightPaddings) / numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, width + heigthAdjustment)
        //self.output.loadProducts()
         self.collectionView?.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - UICollectionViewController Functions
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    private struct StoryBoard
    {
        static let CellIdentifier = "ProductCell"
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(StoryBoard.CellIdentifier, forIndexPath: indexPath) as! ProductViewCell
        cell.product = products[indexPath.row]
        cell.setCircleStyle()
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.selectedProduct = products[indexPath.row]
        router.pushViewDetail()
    }
    
    // MARK: - Inner Functions
    
    
    func showMessage(message: String,messageType:MessageType) {
        showAlert(self, message: message, messageType: messageType)
    }
    
    private func showAlert(controller:UIViewController, message: String, messageType: MessageType){
        let alert = UIAlertController(title: messageType.description, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Button_Acept".localized, style: .Default, handler: { (action: UIAlertAction!) in
        }))
        controller.presentViewController(alert, animated: true, completion: nil)
    }


}

