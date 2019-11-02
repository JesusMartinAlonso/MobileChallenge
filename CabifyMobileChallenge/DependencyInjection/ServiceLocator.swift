//
//  ServiceLocator.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

protocol ServiceLocator {
    
    //Repository
    var productRepository: ProductRepository {get}
    var discountRepository: DiscountRepository {get}
    
    //Use cases
    var getProductsUseCase: GetProductsUseCase {get}
    var getDiscountUseCase: GetDiscountUseCase {get}
    var payOrderUseCase: PayOrderUseCase {get}
    
}
