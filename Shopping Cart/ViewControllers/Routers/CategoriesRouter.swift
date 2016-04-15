//
//  CategoriesRouter.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 13/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import Foundation

import UIKit

protocol CategoriesRouterInput
{
    func pushToProducts()
}

class CategoriesRouter
{
    weak var viewController : CategoriesViewController!
    
    var productsController : ProductController!
    
    // MARK: Navigation
    
    func pushToProducts()
    {
        // NOTE: Teach the router how to navigate to anotvar scene. Some examples follow:
        
        // 1. Trigger a storyboard segue
        // viewController.navigationController?.performSegueWithIdentifier(SEGUETODASHBOARD, sender: nil)
        viewController.performSegueWithIdentifier(SEGUETOPRODUCTS, sender: nil)
        
        // 2. Present another view controller programmatically
        //viewController.presentViewController(self.listaEventosViewController, animated: true, completion: nil)
        
        // 3. Ask the navigation controller to push another view controller onto the stack
        //viewController.navigationController?.pushViewController(self.detailController, animated: true)
    }
    
    // MARK: Communication
    
    func passCategoriesToProducts(segue: UIStoryboardSegue)
    {
        // NOTE: Teach the router which scenes it can communicate with
        
        if segue.identifier == SEGUETOPRODUCTS {
            
            // NOTE: Teach the router how to pass data to the next scene
            self.productsController = segue.destinationViewController as! ProductController
            self.productsController.products = viewController.filteredProducts
        }
    }
}