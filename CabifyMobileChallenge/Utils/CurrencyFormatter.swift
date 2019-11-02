//
//  CurrencyFormatter.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 02/11/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

/// Helper to manage currency used in the app
class CurrencyHelper {
    
    /// Currency used in the app. For this MVP, I have considered that only one currency is supported in the app. A possible new feature would be to support several currencies depending on the location of the user
    static let currency = "$"
    
    /// Returns an string with the given amount formatted
    /// - Parameter amount: Double with the amount to format
    static func format(amount: Double) -> String {
        return "\(amount) \(currency)"
        
    }
    
}
