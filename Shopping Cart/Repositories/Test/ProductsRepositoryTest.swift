//
//  ProductsRepositoryTest.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 10/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import Foundation

import ObjectMapper

private let sharedInstance = ProductsRepositoryTest()

class ProductsRepositoryTest : IProductsRepository {
    
    static let sharedInstance = ProductsRepositoryTest()
    
    class var sharedDispatchInstance: ProductsRepositoryTest {
        struct Stactic {
            static var onceToken:dispatch_once_t = 0
            static var instance: ProductsRepositoryTest? = nil
        }
        dispatch_once(&Stactic.onceToken) {
            Stactic.instance = ProductsRepositoryTest()
        }
        return Stactic.instance!
    }
    
    class var sharedStructInstance: ProductsRepositoryTest {
        struct Stactic {
            static let instance = ProductsRepositoryTest()
        }
        return Stactic.instance
    }
    
    func getProducts(completionHandler: (products: [Products]!, error: NSError!) -> Void) {
        
    }
}
