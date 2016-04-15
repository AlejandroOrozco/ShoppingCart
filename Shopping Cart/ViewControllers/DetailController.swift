//
//  DetailController.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 10/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import UIKit
import Haneke

class DetailController: UIViewController {
    var product : Products?
    
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var categoryDetail: UILabel!
    @IBOutlet weak var releaseDateDetail: UILabel!
    @IBOutlet weak var priceDetail: UILabel!
    @IBOutlet weak var summaryDetail: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageDetail.hnk_setImageFromURL(NSURL(string:(product?.image)!))
        titleDetail.text = product?.name
        categoryDetail.text = product?.category
        releaseDateDetail.text = product?.date
        priceDetail.text = product?.price
        summaryDetail.text = product?.summary
    }
    
    
    @IBAction func openBrowser(sender: AnyObject) {
        
        let url = NSURL(string: product!.link!)!
        UIApplication.sharedApplication().openURL(url)
    }

    
}
