//
//  Enums.swift
//  Shopping Cart
//
//  Created by Alejandro Orozco Builes on 10/04/16.
//  Copyright © 2016 Alejandro Orozco Builes. All rights reserved.
//

import Foundation


enum MessageType : CustomStringConvertible {
    case Error, Warning, Info
    var description: String {
        switch self {
        case Error:
            return "Error_Tittle".localized
        case Warning:
            return "Warning_Tittle".localized
        case Info:
            return "Info_Tittle".localized
        }
    }
}

enum URLsProducts : CustomStringConvertible {
    case getProducts
    var description: String {
        switch self {
        case .getProducts:
            return "\(BASE_URI)"
        }
    }
}