//
//  RemoteDataSource.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 27/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

protocol RemoteDataSource {
    
    func getProducts(result: @escaping (Result<[Product],CustomError>) -> Void)
    
}
