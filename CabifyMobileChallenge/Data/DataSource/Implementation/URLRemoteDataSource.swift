//
//  URLRemoteDataSource.swift
//  CabifyMobileChallenge
//
//  Created by Jesus Martin Alonso on 27/10/2019.
//  Copyright © 2019 Jesus Martin Alonso. All rights reserved.
//

import Foundation

struct URLRemoteDataSource: RemoteDataSource {
    func getProducts(result: @escaping (Result<[Product], CustomError>) -> Void) {
        
        if let url = URL(string: "https://api.myjson.com/bins/4bwec") {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                do {
                    
                    let dictionaryFromJSON = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                    let productsJsonArray = dictionaryFromJSON["products"] as? NSArray
                    let productsDataArray = try JSONSerialization.data(withJSONObject: productsJsonArray!)
                    let res = try JSONDecoder().decode([Product].self, from: productsDataArray)
                    
                    DispatchQueue.main.async {
                        result(.success(res))
                    }
                    
                } catch let error {
                    #if DEBUG
                        print(error)
                    #endif
                    DispatchQueue.main.async {
                        result(.failure(CustomError.Unknown))
                    }
                }
            }.resume()
        }
    }
    
    
}
