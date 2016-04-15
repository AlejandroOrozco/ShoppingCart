//
//  ProductsRepository.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 10/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import Alamofire
import ObjectMapper

private let sharedInstance = ProductsRepository()

class ProductsRepository : IProductsRepository {
    
    static let sharedInstance = ProductsRepository()
    
    class var sharedDispatchInstance: ProductsRepository {
        struct Stactic {
            static var onceToken:dispatch_once_t = 0
            static var instance: ProductsRepository? = nil
        }
        dispatch_once(&Stactic.onceToken) {
            Stactic.instance = ProductsRepository()
        }
        return Stactic.instance!
    }
    
    class var sharedStructInstance: ProductsRepository {
        struct Stactic {
            static let instance = ProductsRepository()
        }
        return Stactic.instance
    }
    
    var alamofireManager : Alamofire.Manager?
    
    
    func getProducts(completionHandler: (products: [Products]!, error: NSError!) -> Void) {
    
        Alamofire.request(.GET,URLsProducts.getProducts.description, encoding: .JSON).validate().responseJSON { (response: Response<AnyObject, NSError>) -> Void in
            switch response.result {
            case let .Success(valueJSON):
                let products = Mapper<Products>().mapArray(valueJSON["feed"]!?["entry"])
                completionHandler(products: products, error: nil)
            case .Failure(let alamoFireError):
                completionHandler(products: nil, error: alamoFireError)
            }
        }
    }
    
    
    
}
