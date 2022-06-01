//
//  File.swift
//  
//
//  Created by Jon Sweeney on 6/1/22.
//

import Foundation

extension URL {
    static func forAllProducts() -> URL? {
        return URL(string: "\(K.QUINN_V2_BASE_URL_SECURE)/products")
    }
}
