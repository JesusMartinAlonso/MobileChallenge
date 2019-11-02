//
//  BulkDiscount.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

/// Bulk discount: [discountPerUnit] discount for each unit buying [minimumQuantity] or more items
struct BulkDiscount: Discount {
    
    /// Minimun quantity to apply the discount
    let minimumQuantity: Int
    
    let discountPerUnit: Double
    
    func amountToDiscount(quantity: Int, unitPrice: Double) -> Double {
        return quantity >= minimumQuantity ? discountPerUnit * Double(quantity) : 0.0
    }
    
    var description: String {
        let localizedString = NSLocalizedString("bulkdiscount_text_description", comment: "")
        return String(format: localizedString,
                      discountPerUnit,
                      CurrencyHelper.currency,
                      minimumQuantity
        )
    }
    
    
}
