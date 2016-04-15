//
//  ProductsPresenter.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 10/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import Foundation

protocol ProductPresenterInput {
    func presentMessage(message: String,messageType:MessageType)
}

protocol ProductPresenterOutput {
    func showMessage(message: String,messageType:MessageType)
}

class ProductPresenter : ProductPresenterInput {
    
    var output: ProductPresenterOutput!
    
    func presentMessage(message: String,messageType:MessageType) {
        self.output.showMessage(message,messageType:messageType)
    }
    
}