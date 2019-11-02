//
//  BulkDiscount.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

struct BulkDiscount: Discount {
    
    let minimumQuantity: Int
    
    let discountPerUnit: Double
    
    func amountToDiscount(quantity: Int, unitPrice: Double) -> Double {
        return quantity >= minimumQuantity ? discountPerUnit * Double(quantity) : 0.0
    }
    
    var description: String {
        //TODO: Localize
        //TODO: Currency
        NSLocalizedString("Bulk discount: \(discountPerUnit)\(CurrencyHelper.currency) discount buying \(minimumQuantity) or more", comment: "")
    }
    
    
}
