//
//  RemoteDataSource.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 27/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

protocol RemoteDataSource {
    
    /// Get the product list of the store
    /// - Parameter result: Result of the query. If succeeds the result will contain an array of products. Otherwise a CustomError is returned
    func getProducts(result: @escaping (Result<[Product],CustomError>) -> Void)
    
}
