//
//  GetProductsUseCase.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 27/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation


/// Use case used to get the list of the products of the store
struct GetProductsUseCase {
    
    let productRepository: ProductRepository
    
    func execute(result: @escaping (Result<[Product],CustomError>) -> Void) {
        productRepository.getProducts(result: result)
    }
    
    
}
