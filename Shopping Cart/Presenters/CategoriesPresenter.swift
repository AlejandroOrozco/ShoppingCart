//
//  CategoriesPresenter.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 13/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import Foundation

protocol CategoriesPresenterInput {
    func presentMessage(message: String,messageType:MessageType)
    func presentCategories(products: [Products])
}

protocol CategoriesPresenterOutput {
    func showCategories(products: [Products])
    func showMessage(message: String,messageType:MessageType)
}

class CategoriesPresenter : CategoriesPresenterInput {
    
    var output: CategoriesPresenterOutput!
    
    func presentMessage(message: String,messageType:MessageType) {
        self.output.showMessage(message,messageType:messageType)
    }
    
    func presentCategories(products: [Products]) {
        self.output.showCategories(products)
    }
    
}
