//
//  ShoppingCartItem.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 31/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

/// Information shown in a ShoppingCartTableViewCell
struct ShoppingCartItem {
    
    typealias DiscountInfo = (description: String, amount: Double)
    
    let productName: String
    let unitPrice: Double
    let quantity: Int
    let totalPrice: Double
    
    /// Discount if available for the product of the cell
    let discount: DiscountInfo?
}
