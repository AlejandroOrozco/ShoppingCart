//
//  ProductsDTO.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 10/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import ObjectMapper
import RealmSwift

class Products : Object,Mappable {
    dynamic var name : String?
    dynamic var category : String?
    dynamic var summary : String?
    dynamic var price : String?
    dynamic var image : String?
    dynamic var date : String?
    dynamic var link : String?
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
    //Impl. of Mappable protocol
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
    
    func mapping(map: Map) {
        name <- map["im:name.label"]
        category <- map["category.attributes.label"]
        summary <- map["summary.label"]
        price <- map["im:price.attributes.amount"]
        image <- map["im:image.2.label"]
        date <- map["im:releaseDate.attributes.label"]
        link <- map["link.attributes.href"]
    }

}