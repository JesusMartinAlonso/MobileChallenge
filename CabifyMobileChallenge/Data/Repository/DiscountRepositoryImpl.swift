//
//  DiscountRepositoryImpl.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 27/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

struct DiscountRepositoryImpl: DiscountRepository {
    
    let localDataSource: LocalDataSource
    
    func getDiscounts(forProducts: [String], result: @escaping (Result<[String:Discount],Error>) -> Void) {
        localDataSource.getDiscounts(forProducts: forProducts, result: result)
    }
    
    
}
