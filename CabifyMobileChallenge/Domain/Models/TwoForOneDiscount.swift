//
//  2x1Discount.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

struct TwoForOneDiscount: Discount {
    
    func amountToDiscount(quantity: Int, unitPrice: Double) -> Double {
        return Double(quantity / 2) * unitPrice
    }
    
    var description: String {
        //TODO: Localize
        NSLocalizedString("2 for 1 discount", comment: "")
    }
}
