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
                return completion(.failure(.noData))
            }
            
            let s = String(decoding: data, as: UTF8.self)
            let startIndex = s.firstIndex(of: "[") ?? s.startIndex
            print(s[startIndex..<s.endIndex])
            let data2 = s[startIndex..<s.endIndex].data(using: .utf8)!
            print(data2)
              
//            let result = try JSONDecoder().decode(YourStructure.self, from: data2)
            
            guard let productsResponse = try? JSONDecoder().decode(ProductsResponse.self, from: data2) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(productsResponse.products))
        }.resume()
    }
}
