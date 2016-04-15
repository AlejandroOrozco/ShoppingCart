//
//  Extensions.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 10/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var getUrlImage : UIImage {
        let url = NSURL(string:(self))
        let data = NSData(contentsOfURL: url!)
        return  UIImage(data: data!)!
    }
}