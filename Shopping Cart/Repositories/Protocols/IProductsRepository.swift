//
//  IProductsRepository.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 10/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//


import Foundation

protocol IProductsRepository {
    
    func getProducts(completionHandler:(products: [Products]!, error: NSError!) -> Void)
    
}