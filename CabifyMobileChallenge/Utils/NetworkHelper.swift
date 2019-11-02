//
//  NetworkHelper.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 27/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation
import Reachability

class NetworkHelper {
    
    /// True if there is Internet connectivity. False otherwise
    func isConnectedToInternet() -> Bool {
        let reachability = try! Reachability()
        return reachability.connection != .unavailable
    }
}
