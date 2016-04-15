//
//  CategoryTableViewCell.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 13/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    

    
    var categoryName: String?{
        didSet{
            updateUI()
        }
    }
    
    func updateUI() {
        self.textLabel?.text =  categoryName
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textLabel?.textAlignment = .Center
    }
}
