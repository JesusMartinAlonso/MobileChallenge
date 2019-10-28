//
//  ProductRepositoryImpl.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 27/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation
import Reachability

struct ProductRepositoryImpl: ProductRepository {
    
    
    let remoteDataSource: RemoteDataSource
    let networkHelper: NetworkHelper
    
    
    func getProducts(result: @escaping (Result<[Product], CustomError>) -> Void) {
        
        if !networkHelper.isConnectedToInternet() {
            result(.failure(CustomError.NoInternetConnection))
        } else {
            remoteDataSource.getProducts(result: result)
        }
       
        
    }
    
    
}
