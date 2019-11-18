//
//  DiscountRepository.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

protocol DiscountRepository {
    
    func getDiscounts(completion: @escaping (Result<[String:[Discount]],Error>) -> Void)
    
}
