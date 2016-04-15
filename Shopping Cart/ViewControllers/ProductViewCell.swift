//
//  ProductViewCell.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 10/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import UIKit
import Haneke

class ProductViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var productName: UILabel!
    
    
    
    
    var product: Products? {
        didSet {
            updateCell()
        }
    }
    
    func updateCell(){
        self.productName.text = product?.name
        self.productImage.hnk_setImageFromURL(NSURL(string:(product?.image)!))
    }
    
    func setCircleStyle(){
        self.productImage.layer.cornerRadius = 100/2.0
        self.productImage.clipsToBounds = true
        self.productImage.layer.borderWidth = 1
        self.productImage.layer.borderColor = UIColor.lightGrayColor().CGColor
    }
        
}