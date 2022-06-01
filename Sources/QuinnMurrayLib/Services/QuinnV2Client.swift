//
//  File.swift
//  
//
//  Created by Jon Sweeney on 6/1/22.
//

import Foundation

public class QuinnV2Client {
    
    func getAllProducts(completion: @escaping (Result<[Product]?, NetworkError>) -> Void) {
        guard let url = URL.forAllProducts() else {
            return completion(.failure(.badUrl))
        }
    }
}
