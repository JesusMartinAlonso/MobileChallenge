//
//  PayOrderUseCase.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 02/11/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation


/// Dummy use case that simulates a payment: It returns successfully after 4 seconds
struct PayOrderUseCase {
    func execute(result: @escaping (Result<Void,Error>) -> Void ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            result(.success(()))
        }
    }
}
