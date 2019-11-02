//
//  ServiceLocatorDefault.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

/// ServiceLocator default implementation. We use lazy vars to avoid loading all dependencies when ServiceLocator instance is created
class ServiceLocatorDefault: ServiceLocator {
    
    
    lazy var networkHelper: NetworkHelper = {
       NetworkHelper()
    }()
    
    lazy var remoteDataSource: RemoteDataSource = {
       URLRemoteDataSource()
    }()
    
    lazy var localDataSource: LocalDataSource = {
       HardCodedLocalDataSource()
    }()
    
    lazy var productRepository: ProductRepository = {
        ProductRepositoryImpl(remoteDataSource: remoteDataSource,
                              networkHelper: networkHelper)
    } ()
    
    lazy var discountRepository: DiscountRepository = {
        DiscountRepositoryImpl(localDataSource: localDataSource)
    } ()
    
    //Use cases
    var getProductsUseCase: GetProductsUseCase {
        GetProductsUseCase(productRepository: productRepository)
    }
    
    var getDiscountUseCase: GetDiscountUseCase {
        GetDiscountUseCase(discountRepository: discountRepository)
    }
    
    var payOrderUseCase: PayOrderUseCase {
        PayOrderUseCase()
    }
    
}
