//
//  CategoriesConfigurator.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 13/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import UIKit

extension CategoriesViewController : CategoriesPresenterOutput {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            router.passCategoriesToProducts(segue)
    }
}

extension CategoriesBusinessLogic : CategoriesControllerOutput{
    
}

extension CategoriesPresenter : CategoriesBusinessLogicOutput{
    
}


class CategoriesConfigurator {
    class var sharedInstance: CategoriesConfigurator {
        struct Static {
            static var instance: CategoriesConfigurator?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = CategoriesConfigurator()
        }
        
        return Static.instance!
    }
    
    // MARK: Configuration
    
    func configure(viewController: CategoriesViewController)
    {
        let router = CategoriesRouter()
        router.viewController = viewController
        
        let presenter = CategoriesPresenter()
        presenter.output = viewController
        
        let interactor = CategoriesBusinessLogic()
        interactor.output = presenter
        viewController.output = interactor
        viewController.router = router
    }
}
