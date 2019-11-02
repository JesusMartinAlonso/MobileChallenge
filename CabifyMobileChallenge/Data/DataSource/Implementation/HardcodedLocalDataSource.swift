//
//  HardcodedLocalDataSource.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 01/11/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

/// This is a hardcoded implementation of local data source (Data is contained in the code)
struct HardCodedLocalDataSource: LocalDataSource {
    
    /// Available discounts:
    /// 2x1 discount for VOUCHER items
    /// Bulk discount for TSHIRT items
    func getDiscounts(forProducts: [String], result: @escaping (Result<[String:Discount],Error>) -> Void) {
        
        result(.success([
            "TSHIRT" : BulkDiscount(minimumQuantity: 3, discountPerUnit: 1.0),
            "VOUCHER" : TwoForOneDiscount()
        ]))
        
        
    }
    
}
