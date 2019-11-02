//
//  ProductRepository.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

protocol ProductRepository {

    //TODO: Document
    func getProducts(result: @escaping (Result<[Product],CustomError>) -> Void)
}
