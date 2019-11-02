//
//  Discount.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

protocol Discount {

    /// Returns the amount to discount given the quantity and the unit price of the product
    /// - Parameter quantity: Number of items to apply the discount
    /// - Parameter unitPrice: Unit price of the product
    func amountToDiscount(quantity: Int, unitPrice: Double) -> Double
    
    /// Description of the discount
    var description: String {get}
}
