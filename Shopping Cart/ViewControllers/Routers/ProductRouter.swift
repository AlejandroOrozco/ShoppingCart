//
//  ProductRouter.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 10/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import UIKit

protocol ProductRouterInput
{
    func pushViewDetail()
}

class ProductRouter
{
    weak var viewController : ProductController!
    
    var detailController : DetailController!
    
    // MARK: Navigation
    
    func pushViewDetail()
    {
        // NOTE: Teach the router how to navigate to another scene. Some examples follow:
        
        // 1. Trigger a storyboard segue
        // viewController.navigationController?.performSegueWithIdentifier(SEGUETODASHBOARD, sender: nil)
        viewController.performSegueWithIdentifier(SEGUETODETAIL, sender: nil)
        
        // 2. Present another view controller programmatically
        //viewController.presentViewController(self.listaEventosViewController, animated: true, completion: nil)
        
        // 3. Ask the navigation controller to push another view controller onto the stack
        //viewController.navigationController?.pushViewController(self.detailController, animated: true)
    }
    
    // MARK: Communication
    
    func passProductToDetail(segue: UIStoryboardSegue)
    {
        // NOTE: Teach the router which scenes it can communicate with
        
        if segue.identifier == SEGUETODETAIL {
            
            // NOTE: Teach the router how to pass data to the next scene
            self.detailController = segue.destinationViewController as! DetailController
            self.detailController.product = viewController.selectedProduct
        }
    }
}

