//
//  LocalDataSource.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 01/11/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

protocol LocalDataSource {
    
    
    /// Retrieve the available discounts for the products passed by argument
    /// - Parameter products: Array of product codes to retrieve its discounts
    /// - Parameter result: Result of the query. If the query succeeds the result will contain a dictionary  [ Product code : Discount ]
    func getDiscounts(forProducts products: [String],
                      result: @escaping (Result<[String:Discount],Error>) -> Void)
    
    
}
