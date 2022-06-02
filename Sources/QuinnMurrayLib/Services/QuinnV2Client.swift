//
//  File.swift
//  
//
//  Created by Jon Sweeney on 6/1/22.
//

import Foundation

public class QuinnV2Client {
    
    public init() { }
    
    public func getAllProducts(completion: @escaping (Result<[ProductElement]?, NetworkError>) -> Void) {
        guard let url = URL.forAllProducts() else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let s = String(decoding: data, as: UTF8.self)
            let startIndex = s.firstIndex(of: "[") ?? s.startIndex
            let s2 = s[startIndex..<s.endIndex]
            print(s2)
            guard let data2 = s2.data(using: .utf8) else {
                print("ERROR converting str to data")
                return completion(.failure(.decodingError))
            }
//            let result = try JSONDecoder().decode(YourStructure.self, from: data2)
            
            guard let productsResponse = try? JSONDecoder().decode(Product.self, from: data2) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(productsResponse))
        }.resume()
    }
}
