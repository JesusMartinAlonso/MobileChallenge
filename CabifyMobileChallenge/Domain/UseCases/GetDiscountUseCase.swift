//
//  GetDiscountUseCase.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 01/11/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

struct GetDiscountUseCase {
    
    let discountRepository: DiscountRepository
    
    /// Execute use case. Execute result closure when the query has been completed.
    /// - Parameter productCode: Code of the product to retrieve its discount
    /// - Parameter result: Result closure.  If the query succeeds the result will contain a dictionary  [ Product code : Discount ]
    func execute(productCodes: [String], result: @escaping (Result<[String:Discount], Error>) -> Void) {
        discountRepository.getDiscounts(forProducts: productCodes, result: result)
    }
}
