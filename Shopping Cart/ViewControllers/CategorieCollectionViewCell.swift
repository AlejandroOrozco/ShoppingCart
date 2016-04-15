//
//  CategorieCollectionViewCell.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 13/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import UIKit

class CategorieCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var viewContainer: UIView!
    
    
    var categoryName: String?{
        didSet{
            updateUI()
        }
    }
    
    func updateUI() {
       self.categoryLabel.text =  categoryName
    }
    
    func setCircleStyle(){
        self.viewContainer.layer.cornerRadius = 200/2.0
        self.viewContainer.clipsToBounds = true
        self.viewContainer.layer.borderWidth = 1
        self.viewContainer.layer.borderColor = UIColor.grayColor().CGColor
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setCircleStyle()
        // Initialization code
    }

}
