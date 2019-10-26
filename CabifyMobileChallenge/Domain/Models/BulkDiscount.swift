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
    
    func amountToDiscount(units: Int, pricePerUnit: Double) -> Double {
        return units >= minimumQuantity ? discountPerUnit * Double(units) : 0.0
    }
    
    
}
