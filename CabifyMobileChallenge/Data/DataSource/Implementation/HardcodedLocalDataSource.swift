//
//  HardcodedLocalDataSource.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 01/11/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

struct HardCodedLocalDataSource: LocalDataSource {
    
    func getDiscounts(forProducts: [String], result: @escaping (Result<[String:Discount],Error>) -> Void) {
        
        result(.success([
            "TSHIRT" : BulkDiscount(minimumQuantity: 3, discountPerUnit: 1.0),
            "VOUCHER" : TwoForOneDiscount()
        ]))
        
        
    }
    
}
