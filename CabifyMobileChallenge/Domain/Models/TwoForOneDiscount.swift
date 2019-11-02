//
//  2x1Discount.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

/// 2x1 discount
struct TwoForOneDiscount: Discount {
    
    func amountToDiscount(quantity: Int, unitPrice: Double) -> Double {
        return Double(quantity / 2) * unitPrice
    }
    
    var description: String {
        NSLocalizedString("twoforonediscount_text_description", comment: "")
    }
}
