//
//  File.swift
//  
//
//  Created by Jon Sweeney on 5/31/22.
//

import Foundation

public struct ProductsResponse: Codable {
    let products: [Product]
}

public struct Product: Codable {
    let id: String
    let price: Double
    let inStock, lowStock, inStorePickup: Bool
//    let title, welcomeDescription, imgURL: String
//    let category: Category
//    let unit: Unit
//    let discount: Int
//    let rating: Int?
//    let imgGroup: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, price, inStock, lowStock, inStorePickup, title
//        case welcomeDescription = "description"
//        case imgURL = "imgUrl"
//        case category, unit, discount, rating, imgGroup
    }
}
