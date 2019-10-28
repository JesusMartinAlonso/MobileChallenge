//
//  Product.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 26/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

/// Class that represent a product of Cabify store
struct Product: Decodable {
    /// Code id
    let code: String
    /// Name of the product
    let name: String
    /// Price of a unit of this product
    let price: Double
}
