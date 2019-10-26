//
//  2x1Discount.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

struct TwoForOneDiscount: Discount {
    
    func amountToDiscount(units: Int, pricePerUnit: Double) -> Double {
        return Double(units / 2) * pricePerUnit
    }
}
