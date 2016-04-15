//
//  ProductBusinessLogic.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 10/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import Foundation


protocol ProductBusinessLogicInput {
}

protocol ProductBusinessLogicOutput {
    func presentMessage(message: String,messageType:MessageType)
}

protocol CategoriesBusinessLogicOutput {
    func presentMessage(message: String,messageType:MessageType)
    func presentCategories(products: [Products])
}

class ProducBusinessLogic : ProductBusinessLogicInput {
    
    var output: ProductBusinessLogicOutput!
    
    var repositoryLocator = RepositoryLocator().productsRepository()

}


class CategoriesBusinessLogic : ProductBusinessLogicInput {
    
    var output: CategoriesBusinessLogicOutput!
    
    var repositoryLocator = RepositoryLocator().productsRepository()
    
    func loadProducts() {
        repositoryLocator.getProducts { (products, error) in
            if products != nil {
                self.output.presentCategories(products)
            }else{
                self.output.presentMessage("ERROR_DEFAULT_MESSAGE".localized,messageType: MessageType.Error)
            }
        }
    }
    
}