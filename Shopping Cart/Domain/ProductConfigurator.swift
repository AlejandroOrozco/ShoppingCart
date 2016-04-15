//
//  ProductsConfigurator.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 10/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import UIKit

extension ProductController : ProductPresenterOutput {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        router.passProductToDetail(segue)
    }
}

extension ProducBusinessLogic : ProductControllerOutput{
    
}

extension ProductPresenter : ProductBusinessLogicOutput{
    
}


class ProductConfigurator {
    class var sharedInstance: ProductConfigurator {
        struct Static {
            static var instance: ProductConfigurator?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = ProductConfigurator()
        }
        
        return Static.instance!
    }
    
    // MARK: Configuration
    
    func configure(viewController: ProductController)
    {
        let router = ProductRouter()
        router.viewController = viewController
        
        let presenter = ProductPresenter()
        presenter.output = viewController
        
        let interactor = ProducBusinessLogic()
        interactor.output = presenter
        viewController.output = interactor
        viewController.router = router
    }
}