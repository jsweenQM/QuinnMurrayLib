//
//  NetworkError.swift
//  
//
//  Created by Jon Sweeney on 6/1/22.
//

import Foundation

public enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}
