//
//  File.swift
//  
//
//  Created by Jon Sweeney on 6/1/22.
//

import Foundation

public class QuinnV2Client {
    
    public init() { }
    
    public func getAllProducts(completion: @escaping (Result<[Product]?, NetworkError>) -> Void) {
        guard let url = URL.forAllProducts() else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.decodingError))
            }
            
            guard let productsResponse = try? JSONDecoder().decode(ProductsResponse.self, from: data) else {
                return completion(.failure(.noData))
            }
        }.resume()
    }
}
