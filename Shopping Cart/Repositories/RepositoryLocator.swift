//
//  RepositoryLocator.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 10/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import Dispatch
import Foundation

private let sharedInstance = RepositoryLocator()

class RepositoryLocator {
    
    static let sharedInstance = RepositoryLocator()
    
    var use_test_repository: Bool
    
    class var sharedDispatchInstance: RepositoryLocator {
        struct Stactic {
            static var onceToken:dispatch_once_t = 0
            static var instance: RepositoryLocator? = nil
        }
        dispatch_once(&Stactic.onceToken) {
            Stactic.instance = RepositoryLocator()
        }
        return Stactic.instance!
    }
    
    class var sharedStructInstance: RepositoryLocator {
        struct Static {
            static let instance = RepositoryLocator()
        }
        return Static.instance
    }
    
    init() {
        use_test_repository = NSBundle.mainBundle().objectForInfoDictionaryKey("Use test repos") as! Bool
    }
    
    func productsRepository() -> IProductsRepository {
        if (use_test_repository) {
            return ProductsRepositoryTest.sharedInstance
        } else {
            return ProductsRepository.sharedInstance
        }
    }
    
    
}